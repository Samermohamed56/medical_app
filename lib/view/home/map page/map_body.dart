import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:medical/view/home/map%20page/location_service.dart';
import 'package:medical/view/home/map%20page/map_constants.dart';
import 'package:medical/view/home/map%20page/search_bar.dart';
import 'package:medical/view/home/map%20page/vending_machine_service.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  final MapController _mapController = MapController();
  LatLng? _userLocation;
  bool _isLoading = false;
  String? _locationError;
  List<VendingMachineModel> _machines = [];

  @override
  void initState() {
    super.initState();
    // في الإميولاتور، نضع موقع افتراضي في مركز أكتوبر
    _userLocation = MapConstants.octoberCenter;
    _showLocationDialog();
    _loadVendingMachines();
  }

  Future<void> _loadVendingMachines() async {
    try {
      final machines = await VendingMachineService.fetchVendingMachines();
      if (_userLocation != null) {
        VendingMachineService.updateDistances(machines, _userLocation!);
      }
      setState(() {
        _machines = machines;
      });
    } catch (e) {
      // TODO: معالجة الأخطاء
    }
  }

  void _moveToMachine(VendingMachineModel machine) {
    _mapController.move(machine.position, MapConstants.initialZoom);
  }

  // عرض مربع حوار تفعيل الموقع
  Future<void> _showLocationDialog() async {
    if (!mounted) return;
    
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('تفعيل خدمة الموقع'),
        content: Text('يجب تفعيل خدمة الموقع لاستخدام التطبيق. سيتم استخدام موقعك فقط عند استخدام التطبيق.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _checkLocationServices();
            },
            child: Text('موافق'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // في الإميولاتور نستخدم الموقع الافتراضي
              setState(() {
                _locationError = null;
              });
            },
            child: Text('استخدام موقع افتراضي'),
          ),
        ],
      ),
    );
  }

  Future<void> _checkLocationServices() async {
    setState(() {
      _isLoading = true;
      _locationError = null;
    });

    try {
      bool serviceEnabled = await LocationService.isLocationServiceEnabled();
      if (!serviceEnabled) {
        bool? openSettings = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('خدمة الموقع غير مفعلة'),
            content: Text('هل تريد فتح إعدادات الموقع لتفعيل الخدمة؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('نعم'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('لا'),
              ),
            ],
          ),
        );

        if (openSettings == true) {
          await LocationService.openLocationSettings();
        } else {
          setState(() {
            _locationError = 'خدمة الموقع غير مفعلة';
            _isLoading = false;
          });
          return;
        }
      }

      LocationPermission permission = await LocationService.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationError = 'تم رفض إذن الوصول إلى الموقع';
          _isLoading = false;
        });
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        bool? openSettings = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('إذن الموقع مرفوض'),
            content: Text('تم رفض إذن الوصول إلى الموقع بشكل دائم. هل تريد فتح إعدادات التطبيق لتغيير الإذن؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('نعم'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('لا'),
              ),
            ],
          ),
        );

        if (openSettings == true) {
          await LocationService.openAppSettings();
        } else {
          setState(() {
            _locationError = 'تم رفض إذن الوصول إلى الموقع بشكل دائم';
            _isLoading = false;
          });
          return;
        }
      }

      final location = await LocationService.getCurrentLocation();
      setState(() {
        _userLocation = location;
        _isLoading = false;
      });
      _mapController.move(_userLocation!, MapConstants.initialZoom);

    } catch (e) {
      setState(() {
        print( "Error:0000000000000000000000000000000000000000000000000000000000000000000000000 $e");
        _locationError = 'حدث خطأ في الحصول على الموقع';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: MapConstants.octoberCenter,
            initialZoom: MapConstants.initialZoom,
            maxZoom: MapConstants.maxZoom,
            minZoom: MapConstants.minZoom,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
            
            // المنطقة الخارجية
            PolygonLayer(
              polygons: [
                Polygon(
                  points: MapConstants.outerBoundaryPoints,
                  color: Colors.grey.withOpacity(0.3),
                  borderColor: Colors.transparent,
                ),
              ],
            ),

            // حدود مدينة 6 أكتوبر
            PolygonLayer(
              polygons: [
                Polygon(
                  points: MapConstants.octoberBoundaryPoints,
                  color: Colors.transparent,
                  borderColor: Colors.blue,
                  borderStrokeWidth: 2.0,
                ),
              ],
            ),

            // ماركر موقع المستخدم
            if (_userLocation != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: _userLocation!,
                    width: 50.0,
                    height: 50.0,
                    child: Icon(Icons.my_location, color: Colors.red, size: 40),
                  ),
                ],
              ),

            // ماركرز ماكينات البيع
            MarkerLayer(
              markers: _machines.map((machine) {
                return Marker(
                  point: machine.position,
                  width: 200.0,
                  height: 70.0,
                  child: GestureDetector(
                    onTap: () => _moveToMachine(machine),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            machine.location,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(Icons.room, color: Colors.blue, size: 40),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        
        // شريط البحث
        SearchBarWidget(
          machines: _machines,
          onMachineSelected: _moveToMachine,
        ),

        // زر تحديد الموقع
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: _isLoading ? null : _checkLocationServices,
            child: _isLoading 
              ? CircularProgressIndicator(color: Colors.white)
              : Icon(Icons.my_location),
          ),
        ),

        // رسالة الخطأ
        if (_locationError != null)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.white,
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _locationError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _locationError = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

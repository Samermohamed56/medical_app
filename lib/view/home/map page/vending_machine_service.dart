import 'dart:math';

import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class VendingMachineModel {
  final int machineId;
  final String location;
  final String ?qr;
  final int ?capacity;
  final int ?adminId;
  final String ?adminName;
  final double latitude;
  final double longitude;
  double? distance;

  VendingMachineModel({
    required this.machineId,
    required this.location,
     this.qr,
     this.capacity,
     this.adminId,
    this.adminName,
    required this.latitude,
    required this.longitude,
    this.distance,
  });

  factory VendingMachineModel.fromJson(Map<String, dynamic> json) {
    return VendingMachineModel(
      machineId: json['machineId'] as int,
      location: json['location'] as String,
      qr: json['qr'] as String,
      capacity: json['capacity'] as int,
      adminId: json['adminId'] as int,
      adminName: json['adminName'] as String,
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
    );
  }

  LatLng get position => LatLng(latitude, longitude);
}

class VendingMachineService {
  static const double _earthRadius = 6371; // بالكيلومتر

  // حساب المسافة بين نقطتين باستخدام صيغة هافرساين
  static double calculateDistance(LatLng point1, LatLng point2) {
    var lat1 = point1.latitude;
    var lon1 = point1.longitude;
    var lat2 = point2.latitude;
    var lon2 = point2.longitude;

    var dLat = _toRadians(lat2 - lat1);
    var dLon = _toRadians(lon2 - lon1);

    lat1 = _toRadians(lat1);
    lat2 = _toRadians(lat2);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    var c = 2 * asin(sqrt(a));
    return _earthRadius * c * 1000; // تحويل إلى متر
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }

  // تحديث المسافات للماكينات بناءً على موقع المستخدم
  static List<VendingMachineModel> updateDistances(
    List<VendingMachineModel> machines,
    LatLng userLocation,
  ) {
    for (var machine in machines) {
      machine.distance = calculateDistance(
        userLocation,
        machine.position,
      );
    }
    // ترتيب الماكينات حسب المسافة
    machines.sort((a, b) => (a.distance ?? 0).compareTo(b.distance ?? 0));
    return machines;
  }







  // جلب الماكينات من API
  static Future<List<VendingMachineModel>> fetchVendingMachines() async {
  try {
    final response = await Dio().get(
      'https://mvmwebapp-freph8bvg6euapa3.uaenorth-01.azurewebsites.net/api/VendingMachine',
    );

    final data = response.data as List;
    return data.map((json) => VendingMachineModel.fromJson(json)).toList();
  } catch (e) {
    print("فشل في جلب بيانات الماكينات: $e");
    return [];
  }
}

  // جلب الماكينات من API مع تحديد الموقع
  static Future<List<VendingMachineModel>> fetchVendingMachinesWithLocation(
    LatLng userLocation,
  ) async {
    try {
      final machines = await fetchVendingMachines();
      return updateDistances(machines, userLocation);
    } catch (e) {
      print("فشل في جلب بيانات الماكينات: $e");
      return [];
    }
  }

} 
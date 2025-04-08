import 'package:latlong2/latlong.dart';

class VendingMachine {
  final String name;
  final LatLng location;
  final int distance;

  const VendingMachine({
    required this.name,
    required this.location,
    required this.distance,
  });
}

class MapConstants {
  // مركز مدينة 6 أكتوبر
  static const LatLng octoberCenter = LatLng(29.9653, 30.9456);

  // نقاط حدود مدينة 6 أكتوبر
  static final List<LatLng> octoberBoundaryPoints = [
    LatLng(29.9800, 30.8800), // الشمال الغربي
    LatLng(30.0000, 30.9500), // الشمال
    LatLng(29.9900, 31.0200), // الشمال الشرقي
    LatLng(29.9500, 31.0100), // الشرق
    LatLng(29.9200, 30.9800), // الجنوب الشرقي
    LatLng(29.9100, 30.9300), // الجنوب
    LatLng(29.9200, 30.8700), // الجنوب الغربي
    LatLng(29.9500, 30.8600), // الغرب
  ];

  // نقاط المنطقة الخارجية
  static final List<LatLng> outerBoundaryPoints = [
    LatLng(30.1000, 30.7000),
    LatLng(30.1000, 31.2000),
    LatLng(29.8000, 31.2000),
    LatLng(29.8000, 30.7000),
  ];

  // معلومات ماكينات البيع
  // static final List<VendingMachine> vendingMachinesInfo = [
  //   VendingMachine(
  //     name: 'وادي دجلة - 6 أكتوبر',
  //     location: LatLng(29.9653, 30.9456),
  //     distance: 30,
  //   ),
  //   VendingMachine(
  //     name: 'مول العرب',
  //     location: LatLng(29.9730, 30.9337),
  //     distance: 110,
  //   ),
  //   VendingMachine(
  //     name: 'الحي المتميز',
  //     location: LatLng(29.9600, 30.9180),
  //     distance: 250,
  //   ),
  //   VendingMachine(
  //     name: 'منطقة الشيخ زايد',
  //     location: LatLng(29.9550, 30.9250),
  //     distance: 300,
  //   ),
  //   VendingMachine(
  //     name: 'منطقة الأندلس',
  //     location: LatLng(29.9700, 30.9400),
  //     distance: 400,
  //   ),
  //   VendingMachine(
  //     name: 'منطقة الوراق',
  //     location: LatLng(29.9500, 30.9350),
  //     distance: 500,
  //   ),
  // ];

  // إعدادات الخريطة
  static const double initialZoom = 15.0;
  static const double maxZoom = 20.0;
  static const double minZoom = 3.0;
} 
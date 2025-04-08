import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  // تحقق من حالة خدمة الموقع
  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // طلب إذن الوصول للموقع
  static Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  // الحصول على الموقع الحالي
 static Future<LatLng> getCurrentLocation() async {
  try {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: 5),
    );
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    throw Exception('تعذر الحصول على الموقع الحالي: $e');
  }
}
// الحصول على اخر موقع 
static Future<LatLng?> getLastKnownLocation() async {
  final position = await Geolocator.getLastKnownPosition();
  if (position != null) {
    return LatLng(position.latitude, position.longitude);
  }
  return null;
}



  // فتح إعدادات الموقع
  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // فتح إعدادات التطبيق
  static Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
} 
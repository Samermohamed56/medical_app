class VendingMachine {
  final int machineId;
  final String location;
  final String qr;
  final int capacity;
  final int adminId;
  final String? adminName;
  final double latitude;
  final double longitude;

  VendingMachine({
    required this.machineId,
    required this.location,
    required this.qr,
    required this.capacity,
    required this.adminId,
    this.adminName,
    required this.latitude,
    required this.longitude,
  });

  factory VendingMachine.fromJson(Map<String, dynamic> json) {
    return VendingMachine(
/*************  ✨ Windsurf Command ⭐  *************/
  /// Converts the Vending object into a JSON map representation.
  /// 
  /// Returns a map containing key-value pairs representing the 
  /// fields of the Vending object, including 'machineId', 'location', 
  /// 'qr', 'capacity', and 'adminName'.

/*******  b34c7dad-c704-4e86-a190-f42c734cdc2d  *******/      machineId: json['machineId'],
      location: json['location'],
      qr: json['qr'],
      capacity: json['capacity'],
      adminId: json['adminId'],
      adminName: json['adminName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'machineId': machineId,
      'location': location,
      'qr': qr,
      'capacity': capacity,
      'adminId': adminId,
      'adminName': adminName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Vending {
  int? machineId;
  String? location;
  String? qr;
  int? capacity;
  String? adminName;

  Vending({
    this.machineId,
    this.location,
    this.qr,
    this.capacity,
    this.adminName,
  });

  factory Vending.fromJson(Map<String, dynamic> json) => Vending(
        machineId: json['machineId'] as int?,
        location: json['location'] as String?,
        qr: json['qr'] as String?,
        capacity: json['capacity'] as int?,
        adminName: json['adminName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'machineId': machineId,
        'location': location,
        'qr': qr,
        'capacity': capacity,
        'adminName': adminName,
      };
}

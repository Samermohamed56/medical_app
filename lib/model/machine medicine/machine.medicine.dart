class Machine {
  int? machineId;
  String? machineLocation;
  int? medicineId;
  String? medicineName;
  int? medicinePrice;
  int? quantity;

  Machine({
    this.machineId,
    this.machineLocation,
    this.medicineId,
    this.medicineName,
    this.medicinePrice,
    this.quantity,
  });

  factory Machine.fromJson(Map<String, dynamic> json) => Machine(
        machineId: json['machineId'] as int?,
        machineLocation: json['machineLocation'] as String?,
        medicineId: json['medicineId'] as int?,
        medicineName: json['medicineName'] as String?,
        medicinePrice: json['medicinePrice'] as int?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'machineId': machineId,
        'machineLocation': machineLocation,
        'medicineId': medicineId,
        'medicineName': medicineName,
        'medicinePrice': medicinePrice,
        'quantity': quantity,
      };
}

class Purchase {
  int? medicineId;
  String? medicineName;
  int? quantity;
  int? pricePerUnit;
  int? totalPriceUnit;

  Purchase({
    this.medicineId,
    this.medicineName,
    this.quantity,
    this.pricePerUnit,
    this.totalPriceUnit,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        medicineId: json['medicineId'] as int?,
        medicineName: json['medicineName'] as String?,
        quantity: json['quantity'] as int?,
        pricePerUnit: json['pricePerUnit'] as int?,
        totalPriceUnit: json['totalPriceUnit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'medicineId': medicineId,
        'medicineName': medicineName,
        'quantity': quantity,
        'pricePerUnit': pricePerUnit,
        'totalPriceUnit': totalPriceUnit,
      };
}

class Item {
  int? medicineId;
  String? medicineName;
  int? quantity;
  int? pricePerUnit;
  int? totalPriceUnit;

  Item({
    this.medicineId,
    this.medicineName,
    this.quantity,
    this.pricePerUnit,
    this.totalPriceUnit,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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

class Medicine {
  int? medicineId;
  String? medicineName;
  int? medicinePrice;
  int? stock;
  DateTime? expirationDate;
  String? description;
  String? categoryName;

  Medicine({
    this.medicineId,
    this.medicineName,
    this.medicinePrice,
    this.stock,
    this.expirationDate,
    this.description,
    this.categoryName,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        medicineId: json['medicineId'] as int?,
        medicineName: json['medicineName'] as String?,
        medicinePrice: json['medicinePrice'] as int?,
        stock: json['stock'] as int?,
        expirationDate: json['expirationDate'] == null
            ? null
            : DateTime.parse(json['expirationDate'] as String),
        description: json['description'] as String?,
        categoryName: json['categoryName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'medicineId': medicineId,
        'medicineName': medicineName,
        'medicinePrice': medicinePrice,
        'stock': stock,
        'expirationDate': expirationDate?.toIso8601String(),
        'description': description,
        'categoryName': categoryName,
      };
}

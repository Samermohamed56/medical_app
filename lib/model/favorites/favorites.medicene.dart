class Favorites {
  int? medicineId;
  String? medicineName;
  int? medicinePrice;
  DateTime? addedDate;
  String? medicineImageUrl;

  Favorites({
    this.medicineId,
    this.medicineName,
    this.medicinePrice,
    this.addedDate,
    this.medicineImageUrl,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        medicineId: json['medicineId'] as int?,
        medicineName: json['medicineName'] as String?,
        medicinePrice: json['medicinePrice'] as int?,
        addedDate: json['addedDate'] == null
            ? null
            : DateTime.parse(json['addedDate'] as String),
        medicineImageUrl: json['medicineImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'medicineId': medicineId,
        'medicineName': medicineName,
        'medicinePrice': medicinePrice,
        'addedDate': addedDate?.toIso8601String(),
        'medicineImageUrl': medicineImageUrl,
      };
}

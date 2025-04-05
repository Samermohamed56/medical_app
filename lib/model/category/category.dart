class Category {
  int? categoryId;
  String? categoryName;
  String? description;
  int? medicineCount;

  Category({
    this.categoryId,
    this.categoryName,
    this.description,
    this.medicineCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json['categoryId'] as int?,
        categoryName: json['categoryName'] as String?,
        description: json['description'] as String?,
        medicineCount: json['medicineCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'categoryName': categoryName,
        'description': description,
        'medicineCount': medicineCount,
      };
}

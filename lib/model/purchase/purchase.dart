import 'item.dart';

class Purchase {
  int? purchaseId;
  DateTime? purchaseDate;
  int? totalPrice;
  int? machineId;
  List<Item>? items;

  Purchase({
    this.purchaseId,
    this.purchaseDate,
    this.totalPrice,
    this.machineId,
    this.items,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        purchaseId: json['purchaseId'] as int?,
        purchaseDate: json['purchaseDate'] == null
            ? null
            : DateTime.parse(json['purchaseDate'] as String),
        totalPrice: json['totalPrice'] as int?,
        machineId: json['machineId'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'purchaseId': purchaseId,
        'purchaseDate': purchaseDate?.toIso8601String(),
        'totalPrice': totalPrice,
        'machineId': machineId,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}

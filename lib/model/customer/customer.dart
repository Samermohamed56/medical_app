class Customer {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? image;

  Customer({
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.image,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json['customerId'] as int?,
        customerName: json['customerName'] as String?,
        customerEmail: json['customerEmail'] as String?,
        customerPhone: json['customerPhone'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'customerName': customerName,
        'customerEmail': customerEmail,
        'customerPhone': customerPhone,
        'image': image,
      };
}

class Admin {
  int? adminId;
  String? adminName;
  String? adminEmail;

  Admin({this.adminId, this.adminName, this.adminEmail});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        adminId: json['adminId'] as int?,
        adminName: json['adminName'] as String?,
        adminEmail: json['adminEmail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'adminId': adminId,
        'adminName': adminName,
        'adminEmail': adminEmail,
      };
}

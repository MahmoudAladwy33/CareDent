class UserModel {
  final String name;
  final String email;
  final String phone;
  final String healthRecord;
  final String? profileImg;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.healthRecord,
    this.profileImg,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['fullName'] ?? '',
      email: json['Email'] ?? '',
      phone: json['Phone'] ?? '',
      healthRecord: json['healthRecord'] ?? '',
      profileImg: json['profileImg'] ?? '',
    );
  }
}

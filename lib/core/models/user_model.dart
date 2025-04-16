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
  Map<String, dynamic> toJson() {
    return {
      'fullName': name,
      'Email': email,
      'Phone': phone,
      'healthRecord': healthRecord,
      'profileImg': profileImg,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? healthRecord,
    String? profileImg,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      healthRecord: healthRecord ?? this.healthRecord,
      profileImg: profileImg ?? this.profileImg,
    );
  }
}

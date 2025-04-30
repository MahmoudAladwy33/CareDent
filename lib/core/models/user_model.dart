class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? healthRecord;
  final String? year;
  final String? skills;
  final String? profileImg;
  final bool createReport;
  final String role;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.healthRecord,
    this.year,
    this.skills,
    this.profileImg,
    required this.createReport,
    required this.role,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['fullName'] ?? '',
      email: json['Email'] ?? '',
      phone: json['Phone'] ?? '',
      healthRecord: json['healthRecord'] ?? '',
      profileImg: json['profileImg'] ?? '',
      createReport: json['createReport'] ?? false,
      role: json['role'] ?? '',
      id: json['_id'] ?? '',
      year: json['year'] ?? '',
      skills: json['skills'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': name,
      'Email': email,
      'Phone': phone,
      'healthRecord': healthRecord,
      'profileImg': profileImg,
      'createReport': createReport,
      'role': role,
      '_id': id,
      'year': year,
      'skills': skills,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? healthRecord,
    String? profileImg,
    bool? createReport,
    String? role,
    String? id,
    String? year,
    String? skills,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      healthRecord: healthRecord ?? this.healthRecord,
      profileImg: profileImg ?? this.profileImg,
      createReport: createReport ?? this.createReport,
      role: role ?? this.role,
      id: id ?? this.id,
      year: year ?? this.year,
      skills: skills ?? this.skills,
    );
  }
}

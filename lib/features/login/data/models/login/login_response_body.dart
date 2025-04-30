import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final UserData data;
  final String token;

  LoginResponseBody({required this.data, required this.token});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  @JsonKey(name: 'Phone')
  final String phone;
  @JsonKey(name: 'Email')
  final String email;
  final String role;
  final String? healthRecord;
  String? profileImg;
  final bool createReport;
  final String? skills;
  final String? year;

  UserData({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.role,
    this.healthRecord,
    this.skills,
    this.year,
    this.profileImg,
    required this.createReport,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String fullName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Phone')
  final String phone;
  final String password;
  final String passwordConfirm;
  final String dateOfBirth;
  final String gender;
  final String role;
  final String? healthRecord;
  final String? skills;
  final String? year;

  SignupRequestBody({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirm,
    required this.dateOfBirth,
    required this.gender,
    this.healthRecord,
    this.skills,
    this.year,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}

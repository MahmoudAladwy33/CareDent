import 'package:json_annotation/json_annotation.dart';
part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  final UserData data;

  UpdateUserResponse({required this.data});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
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
  final String healthRecord;
  final String profileImg;

  UserData({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.role,
    required this.healthRecord,
    required this.profileImg,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

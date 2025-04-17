// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserImageResponse _$UpdateUserImageResponseFromJson(
  Map<String, dynamic> json,
) => UpdateUserImageResponse(
  data: UserData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateUserImageResponseToJson(
  UpdateUserImageResponse instance,
) => <String, dynamic>{'data': instance.data};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  phone: json['Phone'] as String,
  email: json['Email'] as String,
  role: json['role'] as String,
  healthRecord: json['healthRecord'] as String,
  profileImg: json['profileImg'] as String,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'Phone': instance.phone,
  'Email': instance.email,
  'role': instance.role,
  'healthRecord': instance.healthRecord,
  'profileImg': instance.profileImg,
};

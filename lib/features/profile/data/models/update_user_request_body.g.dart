// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequestBody _$UpdateUserRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateUserRequestBody(
  fullName: json['fullName'] as String?,
  phone: json['Phone'] as String?,
  healthRecord: json['healthRecord'] as String?,
);

Map<String, dynamic> _$UpdateUserRequestBodyToJson(
  UpdateUserRequestBody instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'Phone': instance.phone,
  'healthRecord': instance.healthRecord,
};

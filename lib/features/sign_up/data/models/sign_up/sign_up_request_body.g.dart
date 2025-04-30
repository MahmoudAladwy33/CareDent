// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      fullName: json['fullName'] as String,
      email: json['Email'] as String,
      phone: json['Phone'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      healthRecord: json['healthRecord'] as String?,
      skills: json['skills'] as String?,
      year: json['year'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'Email': instance.email,
      'Phone': instance.phone,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'role': instance.role,
      'healthRecord': instance.healthRecord,
      'skills': instance.skills,
      'year': instance.year,
    };

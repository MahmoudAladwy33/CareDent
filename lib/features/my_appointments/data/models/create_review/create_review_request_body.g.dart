// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReviewRequestBody _$CreateReviewRequestBodyFromJson(
  Map<String, dynamic> json,
) => CreateReviewRequestBody(
  title: json['title'] as String,
  ratings: json['ratings'],
  studentId: json['student'] as String,
  appointmentId: json['appointment'] as String,
);

Map<String, dynamic> _$CreateReviewRequestBodyToJson(
  CreateReviewRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'ratings': instance.ratings,
  'student': instance.studentId,
  'appointment': instance.appointmentId,
};

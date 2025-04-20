// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReviewResponse _$CreateReviewResponseFromJson(
  Map<String, dynamic> json,
) => CreateReviewResponse(
  data: ReviewData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateReviewResponseToJson(
  CreateReviewResponse instance,
) => <String, dynamic>{'data': instance.data};

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
  title: json['title'] as String,
  ratings: (json['ratings'] as num).toInt(),
  user: json['user'] as String,
  student: json['student'] as String,
  appointment: json['appointment'] as String,
  id: json['_id'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num).toInt(),
);

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ratings': instance.ratings,
      'user': instance.user,
      'student': instance.student,
      'appointment': instance.appointment,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_reviews_on_specific_student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllReviewsOnSpecificStudentResponse
_$GetAllReviewsOnSpecificStudentResponseFromJson(Map<String, dynamic> json) =>
    GetAllReviewsOnSpecificStudentResponse(
      reviews:
          (json['reviews'] as List<dynamic>)
              .map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetAllReviewsOnSpecificStudentResponseToJson(
  GetAllReviewsOnSpecificStudentResponse instance,
) => <String, dynamic>{'reviews': instance.reviews};

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  id: json['_id'] as String,
  title: json['title'] as String,
  ratings: (json['ratings'] as num).toDouble(),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  student:
      json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
  appointment: json['appointment'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'ratings': instance.ratings,
  'user': instance.user,
  'student': instance.student,
  'appointment': instance.appointment,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  profileImg: json['profileImg'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'profileImg': instance.profileImg,
};

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  profileImg: json['profileImg'] as String?,
);

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'profileImg': instance.profileImg,
};

import 'package:json_annotation/json_annotation.dart';

part 'create_review_response.g.dart';

@JsonSerializable()
class CreateReviewResponse {
  final ReviewData data;

  CreateReviewResponse({required this.data});

  factory CreateReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReviewResponseToJson(this);
}

@JsonSerializable()
class ReviewData {
  final String title;
  final int ratings;
  final String user;
  final String student;
  final String appointment;

  @JsonKey(name: '_id')
  final String id;

  final String createdAt;
  final String updatedAt;

  @JsonKey(name: '__v')
  final int v;

  ReviewData({
    required this.title,
    required this.ratings,
    required this.user,
    required this.student,
    required this.appointment,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);
}

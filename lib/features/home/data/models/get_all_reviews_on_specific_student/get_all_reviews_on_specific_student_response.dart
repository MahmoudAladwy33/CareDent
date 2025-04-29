import 'package:json_annotation/json_annotation.dart';

part 'get_all_reviews_on_specific_student_response.g.dart';

@JsonSerializable()
class GetAllReviewsOnSpecificStudentResponse {
  final List<Review> reviews;

  GetAllReviewsOnSpecificStudentResponse({required this.reviews});

  factory GetAllReviewsOnSpecificStudentResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetAllReviewsOnSpecificStudentResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllReviewsOnSpecificStudentResponseToJson(this);
}

@JsonSerializable()
class Review {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final double ratings;
  final User? user;
  final Student? student;
  final String appointment;
  final String createdAt;
  final String updatedAt;

  Review({
    required this.id,
    required this.title,
    required this.ratings,
    this.user,
    this.student,
    required this.appointment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final String? profileImg;

  User({required this.id, required this.fullName, this.profileImg});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Student {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final String? profileImg;

  Student({required this.id, required this.fullName, this.profileImg});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

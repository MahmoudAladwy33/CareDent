import 'package:json_annotation/json_annotation.dart';
part 'create_review_request_body.g.dart';
@JsonSerializable()
class CreateReviewRequestBody {
  final String title ;
  final dynamic ratings;
  @JsonKey(name: 'student')
  final String studentId;
  @JsonKey(name: 'appointment')
    final String appointmentId;

  CreateReviewRequestBody({
    required this.title,
    required this.ratings,
    required this.studentId,
    required this.appointmentId,
  });

  Map<String, dynamic> toJson() => _$CreateReviewRequestBodyToJson(this);
}

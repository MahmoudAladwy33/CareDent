import 'package:json_annotation/json_annotation.dart';
part 'get_student_appointments_response.g.dart';

@JsonSerializable()
class GetStudentAppointmentsResponse {
  final int count;
  final List<Order> orders;

  GetStudentAppointmentsResponse({required this.count, required this.orders});

  factory GetStudentAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStudentAppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentAppointmentsResponseToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String id;

  final User user;
  final String type;
  final String status;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;
  final String date;
  final String student;
  final String time;

  Order({
    required this.id,
    required this.user,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.date,
    required this.student,
    required this.time,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Phone')
  final String phone;
  final String healthRecord;
  final String ? profileImg;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.healthRecord,
     this.profileImg,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

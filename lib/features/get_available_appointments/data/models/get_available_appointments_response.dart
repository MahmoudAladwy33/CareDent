import 'package:json_annotation/json_annotation.dart';
part 'get_available_appointments_response.g.dart';
@JsonSerializable()
class GetAvailableAppointmentsResponse {
  final int count;

  final List<Appointment> orders;

  GetAvailableAppointmentsResponse({required this.count, required this.orders});

  factory GetAvailableAppointmentsResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetAvailableAppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAvailableAppointmentsResponseToJson(this);
}

@JsonSerializable()
class Appointment {
  @JsonKey(name: '_id')
  final String id;

  final User user;
  final String type;
  final String status;

  final String createdAt;
  final String updatedAt;

  @JsonKey(name: '__v')
  final int v;

  Appointment({
    required this.id,
    required this.user,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
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

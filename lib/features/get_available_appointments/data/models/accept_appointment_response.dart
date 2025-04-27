import 'package:json_annotation/json_annotation.dart';
part 'accept_appointment_response.g.dart';

@JsonSerializable()
class AcceptAppointmentResponse {
  final Order order;
  final String msg;

  AcceptAppointmentResponse({required this.order, required this.msg});

  factory AcceptAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptAppointmentResponseToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final String type;
  final String status;
  final String student;
  final String date;
  final String time;
  final String createdAt;
  final String updatedAt;

  Order({
    required this.id,
    required this.user,
    required this.type,
    required this.status,
    required this.student,
    required this.date,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'get_my_appointments_response.g.dart';

@JsonSerializable()
class GetMyAppointmentsResponse {
  final int count;
  final List<Order> orders;

  GetMyAppointmentsResponse({required this.count, required this.orders});

  factory GetMyAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyAppointmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyAppointmentsResponseToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final String type;
  final String status;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final String? date;
  final String? time;
  final Student? student;

  Order({
    required this.id,
    required this.user,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.v,
    this.date,
    this.time,
    this.student,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Student {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Phone')
  final String phone;
  final String healthRecord;

  Student({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.healthRecord,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

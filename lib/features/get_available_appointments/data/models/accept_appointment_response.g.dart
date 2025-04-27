// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptAppointmentResponse _$AcceptAppointmentResponseFromJson(
  Map<String, dynamic> json,
) => AcceptAppointmentResponse(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  msg: json['msg'] as String,
);

Map<String, dynamic> _$AcceptAppointmentResponseToJson(
  AcceptAppointmentResponse instance,
) => <String, dynamic>{'order': instance.order, 'msg': instance.msg};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['_id'] as String,
  user: json['user'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  student: json['student'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'type': instance.type,
  'status': instance.status,
  'student': instance.student,
  'date': instance.date,
  'time': instance.time,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

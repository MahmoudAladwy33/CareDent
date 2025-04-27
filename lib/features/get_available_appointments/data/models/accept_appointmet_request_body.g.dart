// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_appointmet_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptAppointmetRequestBody _$AcceptAppointmetRequestBodyFromJson(
  Map<String, dynamic> json,
) => AcceptAppointmetRequestBody(
  appointmentId: json['appointment'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
);

Map<String, dynamic> _$AcceptAppointmetRequestBodyToJson(
  AcceptAppointmetRequestBody instance,
) => <String, dynamic>{
  'appointment': instance.appointmentId,
  'date': instance.date,
  'time': instance.time,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_available_appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAvailableAppointmentsResponse _$GetAvailableAppointmentsResponseFromJson(
  Map<String, dynamic> json,
) => GetAvailableAppointmentsResponse(
  count: (json['count'] as num).toInt(),
  orders:
      (json['orders'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetAvailableAppointmentsResponseToJson(
  GetAvailableAppointmentsResponse instance,
) => <String, dynamic>{'count': instance.count, 'orders': instance.orders};

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
  id: json['_id'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  type: json['type'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num).toInt(),
);

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  email: json['Email'] as String,
  phone: json['Phone'] as String,
  healthRecord: json['healthRecord'] as String,
  profileImg: json['profileImg'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'Email': instance.email,
  'Phone': instance.phone,
  'healthRecord': instance.healthRecord,
  'profileImg': instance.profileImg,
};

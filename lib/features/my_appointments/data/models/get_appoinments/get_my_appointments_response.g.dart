// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyAppointmentsResponse _$GetMyAppointmentsResponseFromJson(
  Map<String, dynamic> json,
) => GetMyAppointmentsResponse(
  count: (json['count'] as num).toInt(),
  orders:
      (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetMyAppointmentsResponseToJson(
  GetMyAppointmentsResponse instance,
) => <String, dynamic>{'count': instance.count, 'orders': instance.orders};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['_id'] as String,
  user: json['user'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num?)?.toInt(),
  date: json['date'] as String?,
  time: json['time'] as String?,
  student:
      json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'type': instance.type,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'date': instance.date,
  'time': instance.time,
  'student': instance.student,
};

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  email: json['Email'] as String,
  phone: json['Phone'] as String,
  healthRecord: json['healthRecord'] as String,
);

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'Email': instance.email,
  'Phone': instance.phone,
  'healthRecord': instance.healthRecord,
};

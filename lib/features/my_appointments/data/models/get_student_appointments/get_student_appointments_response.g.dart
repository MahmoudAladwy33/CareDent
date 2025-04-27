// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_appointments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentAppointmentsResponse _$GetStudentAppointmentsResponseFromJson(
  Map<String, dynamic> json,
) => GetStudentAppointmentsResponse(
  count: (json['count'] as num).toInt(),
  orders:
      (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetStudentAppointmentsResponseToJson(
  GetStudentAppointmentsResponse instance,
) => <String, dynamic>{'count': instance.count, 'orders': instance.orders};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['_id'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  type: json['type'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num).toInt(),
  date: json['date'] as String,
  student: json['student'] as String,
  time: json['time'] as String,
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
  'student': instance.student,
  'time': instance.time,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  email: json['Email'] as String,
  phone: json['Phone'] as String,
  healthRecord: json['healthRecord'] as String,
  profileImg: json['profileImg'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  '_id': instance.id,
  'fullName': instance.fullName,
  'Email': instance.email,
  'Phone': instance.phone,
  'healthRecord': instance.healthRecord,
  'profileImg': instance.profileImg,
};

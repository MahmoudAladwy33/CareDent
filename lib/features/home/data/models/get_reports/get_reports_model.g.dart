// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportsResponse _$GetReportsResponseFromJson(Map<String, dynamic> json) =>
    GetReportsResponse(
      reports:
          (json['reports'] as List<dynamic>)
              .map((e) => Report.fromJson(e as Map<String, dynamic>))
              .toList(),
      stats: ReportStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReportsResponseToJson(GetReportsResponse instance) =>
    <String, dynamic>{'reports': instance.reports, 'stats': instance.stats};

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  id: json['_id'] as String,
  title: json['title'] as String,
  user: ReportUser.fromJson(json['user'] as Map<String, dynamic>),
  ratings: json['ratings'],
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'user': instance.user,
  'ratings': instance.ratings,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
};

ReportUser _$ReportUserFromJson(Map<String, dynamic> json) => ReportUser(
  id: json['_id'] as String,
  fullName: json['fullName'] as String,
  profileImg: json['profileImg'] as String,
);

Map<String, dynamic> _$ReportUserToJson(ReportUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'profileImg': instance.profileImg,
    };

ReportStats _$ReportStatsFromJson(Map<String, dynamic> json) => ReportStats(
  averageRating: json['averageRating'] as String,
  percentage: json['percentage'] as String,
  totalReports: (json['totalReports'] as num).toInt(),
);

Map<String, dynamic> _$ReportStatsToJson(ReportStats instance) =>
    <String, dynamic>{
      'averageRating': instance.averageRating,
      'percentage': instance.percentage,
      'totalReports': instance.totalReports,
    };

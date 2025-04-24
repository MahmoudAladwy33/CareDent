import 'package:json_annotation/json_annotation.dart';
part 'get_reports_model.g.dart';

@JsonSerializable()
class GetReportsResponse {
  final List<Report> reports;
  final ReportStats stats;

  GetReportsResponse({required this.reports, required this.stats});

  factory GetReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReportsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportsResponseToJson(this);
}

@JsonSerializable()
class Report {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final ReportUser user;
  final dynamic ratings;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  Report({
    required this.id,
    required this.title,
    required this.user,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
    this.v,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class ReportUser {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final String ? profileImg;

  ReportUser({
    required this.id,
    required this.fullName,
     this.profileImg,
  });

  factory ReportUser.fromJson(Map<String, dynamic> json) =>
      _$ReportUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReportUserToJson(this);
}

@JsonSerializable()
class ReportStats {
  final String averageRating;
  final String percentage;
  final int totalReports;

  ReportStats({
    required this.averageRating,
    required this.percentage,
    required this.totalReports,
  });

  factory ReportStats.fromJson(Map<String, dynamic> json) =>
      _$ReportStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ReportStatsToJson(this);
}

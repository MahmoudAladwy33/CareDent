import 'package:json_annotation/json_annotation.dart';
part 'accept_appointmet_request_body.g.dart';

@JsonSerializable()
class AcceptAppointmetRequestBody {
  @JsonKey(name: 'appointment')
  final String appointmentId;
  final String date;
  final String time;

  AcceptAppointmetRequestBody({
    required this.appointmentId,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() => _$AcceptAppointmetRequestBodyToJson(this);
}

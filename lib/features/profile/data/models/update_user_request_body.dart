import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_user_request_body.g.dart';
@JsonSerializable()
class UpdateUserRequestBody {
  
  final String ?fullName;
  @JsonKey(name: 'Phone')
  final String ? phone;
  final String ? healthRecord;
   final String ? skills;
  final String ? year;
  UpdateUserRequestBody({
    this.fullName,
    this.phone,
    this.healthRecord,
    this.skills,
    this.year,
  });

  Map<String, dynamic> toJson() => _$UpdateUserRequestBodyToJson(this);
}

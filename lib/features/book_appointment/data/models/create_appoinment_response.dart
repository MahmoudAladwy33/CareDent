import 'package:json_annotation/json_annotation.dart';
part 'create_appoinment_response.g.dart';

@JsonSerializable()
class CreateAppoinmentResponse {
@JsonKey(name: 'msg')
   final String message;

  CreateAppoinmentResponse({required this.message});
  factory CreateAppoinmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppoinmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAppoinmentResponseToJson(this);
}
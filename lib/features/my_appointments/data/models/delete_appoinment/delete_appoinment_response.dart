import 'package:json_annotation/json_annotation.dart';
part 'delete_appoinment_response.g.dart';
@JsonSerializable()
class DeleteAppoinmentResponse {
  @JsonKey(name: 'msg')
  final String message;

  DeleteAppoinmentResponse({required this.message});

  factory DeleteAppoinmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAppoinmentResponseFromJson(json);
}

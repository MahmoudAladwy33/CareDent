import 'package:json_annotation/json_annotation.dart';
part 'create_appoinment_request_body.g.dart';

@JsonSerializable()
class CreateAppoinmentRequestBody {

  final String type;

  CreateAppoinmentRequestBody({required this.type});

  Map<String, dynamic> toJson() => _$CreateAppoinmentRequestBodyToJson(this);
}

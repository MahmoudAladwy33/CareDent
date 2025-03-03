import 'package:caredent/core/networking/api_constants.dart';
import 'package:caredent/features/login/data/models/login_request_body.dart';
import 'package:caredent/features/login/data/models/login_response_body.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_request_body.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_response.dart';
import 'package:caredent/features/sign_up/data/models/verify_account/verify_account_request_body.dart';
import 'package:caredent/features/sign_up/data/models/verify_account/verify_account_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signUp)
   Future<SignupResponse> signUp(@Body() SignupRequestBody signupRequestBody);

    @POST(ApiConstants.verifyAccount)
  Future<VerifyAccountResponse> verifyAccount(
    @Body() VerifyAccountRequestBody verifyAccountRequestBody,
    @Header('Authorization') String token,
  );
}

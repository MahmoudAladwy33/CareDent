import 'package:caredent/core/networking/api_constants.dart';
import 'package:caredent/features/login/data/models/create_new_password/create_new_password_response.dart';
import 'package:caredent/features/login/data/models/login/login_request_body.dart';
import 'package:caredent/features/login/data/models/login/login_response_body.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_request_body.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_response.dart';
import 'package:caredent/features/sign_up/data/models/verify_account/verify_account_request_body.dart';
import 'package:caredent/features/sign_up/data/models/verify_account/verify_account_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/book_appointment/data/models/create_appoinment_request_body.dart';
import '../../features/book_appointment/data/models/create_appoinment_response.dart';
import '../../features/login/data/models/create_new_password/create_new_password_request_body.dart';
import '../../features/login/data/models/forget_password/forget_pass_email_request_body.dart';
import '../../features/login/data/models/forget_password/forget_pass_response.dart';
import '../../features/login/data/models/verify_password/verify_password_request_body.dart';
import '../../features/login/data/models/verify_password/verify_password_response.dart';
import '../../features/my_appointments/data/models/get_my_appointments_response.dart';
import '../../features/profile/data/models/update_user_request_body.dart';
import '../../features/profile/data/models/update_user_response.dart';
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

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPassResponse> forgetPassword(
    @Body() ForgetPassEmailRequestBody forgetPassEmailRequestBody,
  );

  @POST(ApiConstants.verifyPassword)
  Future<VerifyPasswordResponse> verifyPassword(
    @Body() VerifyPasswordRequestBody verifyPasswordRequestBody,
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.resetPassword)
  Future<CreateNewPasswordResponse> createNewPassword(
    @Header('Authorization') String token,
    @Body() CreateNewPasswordRequestBody createNewPasswordRequestBody,
  );

  @POST(ApiConstants.createAppointment)
  Future<CreateAppoinmentResponse> createAppointment(
    @Body() CreateAppoinmentRequestBody createAppoinmentRequestBody,
    @Header('Authorization') String token,
  );

  @PUT(ApiConstants.updateUser)
  Future<UpdateUserResponse> updateUser(
    @Header('Authorization') String token,
    @Body() UpdateUserRequestBody updateUserRequestBody,
  );

  @GET(ApiConstants.getMyAppointments)
  Future<GetMyAppointmentsResponse> getMyAppointments(
    @Header('Authorization') String token,
  );
}

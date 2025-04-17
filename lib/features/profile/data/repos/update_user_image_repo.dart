import 'dart:developer';
import 'dart:io';
import 'package:caredent/features/profile/data/models/update_user_image_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import 'package:http_parser/http_parser.dart';

class UpdateUserImageRepo {
  final Dio _dio;

  UpdateUserImageRepo(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    );
  }

  Future<ApiResult<UpdateUserImageResponse>> uploadImage(File imageFile) async {
    try {
      // 1. جلب التوكن
      final token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      log("TOKEN USED: Bearer $token"); 

     
      final dio = Dio();

     
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: false,
          maxWidth: 90,
        ),
      );

     
      final fileExtension = imageFile.path.split('.').last.toLowerCase();
      final mimeType = fileExtension == 'jpg' ? 'jpeg' : fileExtension;

     
      MultipartFile multipartFile = await MultipartFile.fromFile(
        imageFile.path,
        filename:
            'profile_${DateTime.now().millisecondsSinceEpoch}.$fileExtension',
        contentType: MediaType('image', mimeType),
      );

      
      FormData formData = FormData.fromMap({'profileImg': multipartFile});

    
      final response = await dio.put(
        'https://caredent.vercel.app/users/updatephoto',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
            'Authorization': token, 
          },
        ),
      );

      // 8. معالجة الرد
      log("Status Code: ${response.statusCode}");
      log("Response Data: ${response.data}");

      UpdateUserImageResponse updateUserImageResponse =
          UpdateUserImageResponse.fromJson(response.data);
      return ApiResult.success(updateUserImageResponse);
    } catch (error) {
      log("Upload Error: $error");
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

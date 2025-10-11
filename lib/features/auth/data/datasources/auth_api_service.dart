import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/features/auth/data/models/login_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/login_response_model.dart';
import 'package:shoppe_app/features/auth/data/models/register_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/register_response_model.dart';
import 'package:shoppe_app/features/auth/data/models/resend_code_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/verification_request_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(AppConstants.loginEndpoint)
  Future<LoginResponseModel> login(@Body() LoginRequestModel request);

  @POST(AppConstants.registerEndpoint)
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel request);

  @POST(AppConstants.verifyCodeEndpoint)
  Future<String> verifyCode(@Body() VerificationRequestModel request);

  @POST(AppConstants.resendCodeEndpoint)
  Future<String> resendVerificationCode(@Body() ResendCodeRequestModel request);

  @POST(AppConstants.resendCodeEndpoint)
  Future<String> sendResetOtp(@Body() ResendCodeRequestModel request);

  @POST(AppConstants.resetPasswordEndpoint)
  Future<String> resetPassword(@Body() ResetPasswordRequestModel request);
}

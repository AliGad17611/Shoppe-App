import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/errors/api_error_handler.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';
import 'package:shoppe_app/core/network/decode_token.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_api_service.dart';
import 'package:shoppe_app/features/auth/data/models/login_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/login_response_model.dart';
import 'package:shoppe_app/features/auth/data/models/register_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/register_response_model.dart';
import 'package:shoppe_app/features/auth/data/models/resend_code_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/verification_request_model.dart';

class AuthRepository {
  final AuthApiService _authApiService;

  AuthRepository(this._authApiService);

  Future<Either<ApiErrorModel, LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    try {
      final response = await _authApiService.login(request);
      // cache the response
      CacheHelper.setSecureData(key: AppConstants.accessToken, value: response.accessToken);
      CacheHelper.setSecureData(key: AppConstants.refreshToken, value: response.refreshToken);
      DecodedToken().saveDecodedToken(response.accessToken);
      return Right(response);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, RegisterResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final response = await _authApiService.register(request);
      return Right(response);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> verifyCode(
    VerificationRequestModel request,
  ) async {
    try {
      final responseMessage = await _authApiService.verifyCode(request);

      // Create VerificationResponseModel from the string response
      return Right(responseMessage);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> resendVerificationCode(
    ResendCodeRequestModel request,
  ) async {
    try {
      final responseMessage = await _authApiService.resendVerificationCode(
        request,
      );

      // Create VerificationResponseModel from the string response
      return Right(responseMessage);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> sendResetOtp(
    ResendCodeRequestModel request,
  ) async {
    try {
      final responseMessage = await _authApiService.sendResetOtp(request);
      return Right(responseMessage);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    try {
      final responseMessage = await _authApiService.resetPassword(request);
      return Right(responseMessage);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}

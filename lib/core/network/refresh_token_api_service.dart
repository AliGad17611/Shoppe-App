import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/network/refresh_token_request_model.dart';
import 'package:shoppe_app/core/network/refresh_token_response_model.dart';

part 'refresh_token_api_service.g.dart';

@RestApi()
abstract class RefreshTokenApiService {
  factory RefreshTokenApiService(Dio dio) = _RefreshTokenApiService;

  @POST(AppConstants.refreshTokenEndpoint)
  Future<RefreshTokenResponseModel> refreshToken(
    @Body() RefreshTokenRequestModel request,
  );
}


import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/network/refresh_token_service.dart';

class ApiInterceptor extends Interceptor {
  //to prevent multiple requests while refreshing token
  bool isRefreshing = false;
  //to make reminder request wait for the token to be refreshed
  Completer<void>? refreshCompleter;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await CacheHelper.getSecureData(
      key: AppConstants.accessToken,
    );
    options.headers[AppConstants.authorization] = token != null
        ? 'Bearer $token'
        : null;
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final token = await CacheHelper.getSecureData(
      key: AppConstants.accessToken,
    );

    if (err.response?.statusCode == 401 && token != null) {
      // Prevent multiple refresh requests
      if (!isRefreshing) {
        isRefreshing = true;
        refreshCompleter = Completer<void>();
        try {
          // Use the new RefreshTokenService
          final refreshTokenService = sl<RefreshTokenService>();
          await refreshTokenService.refreshToken();
          refreshCompleter?.complete();
        } catch (e) {
          refreshCompleter?.completeError(e);
        } finally {
          isRefreshing = false;
        }
      } else {
        await refreshCompleter?.future;
      }

      // Retry the original request with the new token
      try {
        final newToken = await CacheHelper.getSecureData(
          key: AppConstants.accessToken,
        );
        if (newToken != null) {
          options.headers[AppConstants.authorization] = 'Bearer $newToken';
          final dio = sl<Dio>();
          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        return handler.reject(err);
      }
    }

    return super.onError(err, handler);
  }
}

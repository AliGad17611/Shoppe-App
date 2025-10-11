import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/network/api_interceptor.dart';

class DioFactory {
  final Dio _dio;
  Dio get dio => _dio;
  DioFactory() : _dio = Dio() {
    _dio.options
      ..baseUrl = AppConstants.baseUrl
      ..connectTimeout = Duration(milliseconds: AppConstants.connectionTimeout)
      ..receiveTimeout = Duration(milliseconds: AppConstants.receiveTimeout)
      ..sendTimeout = Duration(milliseconds: AppConstants.sendTimeout);
    _dio.interceptors.addAll([
      ApiInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    ]);
  }
}

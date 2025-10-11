part of 'app_constants.dart';

class ApiConstants {
  static const String baseUrl = 'https://accessories-eshop.runasp.net/api/';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
  static const String authorization = 'Authorization';

  // API Endpoints
  static const String loginEndpoint = 'auth/login';
  static const String registerEndpoint = 'auth/register';
  static const String verifyCodeEndpoint = 'auth/verify-email';
  static const String resendCodeEndpoint = 'auth/resend-otp';
  static const String resetPasswordEndpoint = 'auth/reset-password';
  static const String refreshTokenEndpoint = 'auth/refresh-token';
  static const String categoriesEndpoint = 'categories';
}

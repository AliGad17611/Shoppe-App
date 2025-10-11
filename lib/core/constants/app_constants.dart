part 'api_constants.dart';
part 'storage_constants.dart';
part 'ui_constants.dart';
part 'pagination_constants.dart';

class AppConstants {
  // API
  static const String baseUrl = ApiConstants.baseUrl;
  static const int connectionTimeout = ApiConstants.connectionTimeout;
  static const int receiveTimeout = ApiConstants.receiveTimeout;
  static const int sendTimeout = ApiConstants.sendTimeout;
  static const String authorization = ApiConstants.authorization;
  // API Endpoints
  static const String loginEndpoint = ApiConstants.loginEndpoint;
  static const String registerEndpoint = ApiConstants.registerEndpoint;
  static const String verifyCodeEndpoint = ApiConstants.verifyCodeEndpoint;
  static const String resendCodeEndpoint = ApiConstants.resendCodeEndpoint;
  static const String resetPasswordEndpoint =
      ApiConstants.resetPasswordEndpoint;
  static const String refreshTokenEndpoint = ApiConstants.refreshTokenEndpoint;

  // Storage
  static const String accessToken = StorageConstants.accessToken;
  static const String refreshToken = StorageConstants.refreshToken;
  static const String userId = StorageConstants.userId;
  static const String email = StorageConstants.email;
  static const String username = StorageConstants.username;
  static const String onboardingKey = StorageConstants.onboardingKey;

  // UI
  static const double defaultPadding = UIConstants.defaultPadding;
  static const double defaultBorderRadius = UIConstants.defaultBorderRadius;

  // Pagination
  static const int pageSize = PaginationConstants.pageSize;
}

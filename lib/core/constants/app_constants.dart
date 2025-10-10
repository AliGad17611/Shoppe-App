part 'api_constants.dart';
part 'storage_constants.dart';
part 'ui_constants.dart';
part 'pagination_constants.dart';

class AppConstants {
  // API
  static String get baseUrl => ApiConstants.baseUrl;
  static String get apiVersion => ApiConstants.apiVersion;
  static int get connectionTimeout => ApiConstants.connectionTimeout;
  static int get receiveTimeout => ApiConstants.receiveTimeout;

  // API Endpoints
  static String get loginEndpoint => ApiConstants.loginEndpoint;
  static String get registerEndpoint => ApiConstants.registerEndpoint;

  // Storage
  static String get tokenKey => StorageConstants.tokenKey;
  static String get userKey => StorageConstants.userKey;

  // UI
  static double get defaultPadding => UIConstants.defaultPadding;
  static double get defaultBorderRadius => UIConstants.defaultBorderRadius;

  // Pagination
  static int get pageSize => PaginationConstants.pageSize;
}

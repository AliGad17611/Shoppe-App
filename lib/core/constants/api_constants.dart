part of 'app_constants.dart';

class ApiConstants {
  static const String baseUrl = 'https://accessories-eshop.runasp.net';
  static const String apiVersion = '/api';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
}

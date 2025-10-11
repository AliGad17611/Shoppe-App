import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/network/refresh_token_service.dart';

/// Legacy function maintained for backward compatibility
/// Uses the new RefreshTokenService following clean architecture principles
Future<void> refreshToken() async {
  final refreshTokenService = sl<RefreshTokenService>();
  await refreshTokenService.refreshToken();
}

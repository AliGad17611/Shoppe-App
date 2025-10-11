import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';

class DecodedToken {
  void saveDecodedToken(String token) {
    final tokenData = JwtDecoder.decode(token);
    CacheHelper.setSecureData(
      key: AppConstants.userId,
      value: tokenData["sub"],
    );
    CacheHelper.setSecureData(
      key: AppConstants.email,
      value: tokenData["email"],
    );
    CacheHelper.set(key: AppConstants.username, value: tokenData["name"]);
  }
}

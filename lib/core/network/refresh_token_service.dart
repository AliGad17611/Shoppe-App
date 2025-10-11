import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/errors/api_error_handler.dart';
import 'package:shoppe_app/core/network/decode_token.dart';
import 'package:shoppe_app/core/network/refresh_token_api_service.dart';
import 'package:shoppe_app/core/network/refresh_token_request_model.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';

class RefreshTokenService {
  final RefreshTokenApiService _refreshTokenApiService;

  RefreshTokenService(this._refreshTokenApiService);

  Future<void> refreshToken() async {
    try {
      // Get current tokens from cache
      final currentAccessToken = await CacheHelper.getSecureData(
        key: AppConstants.accessToken,
      );
      final currentRefreshToken = await CacheHelper.getSecureData(
        key: AppConstants.refreshToken,
      );

      if (currentAccessToken == null || currentRefreshToken == null) {
        log('No tokens found in cache');
        await _handleTokenRefreshFailure('No tokens found');
        return;
      }

      // Create request model
      final request = RefreshTokenRequestModel(
        accessToken: currentAccessToken,
        refreshToken: currentRefreshToken,
      );

      // Call API service to refresh token
      try {
        final response = await _refreshTokenApiService.refreshToken(request);

        log('Token refreshed successfully');

        // Save new tokens to secure storage
        await CacheHelper.setSecureData(
          key: AppConstants.accessToken,
          value: response.accessToken,
        );

        await CacheHelper.setSecureData(
          key: AppConstants.refreshToken,
          value: response.refreshToken,
        );

        // Decode and save token data
        DecodedToken().saveDecodedToken(response.accessToken);

        log('New tokens saved successfully');
      } catch (e) {
        final errorModel = ApiErrorHandler.handle(e);
        log('Token refresh failed: ${errorModel.message}');
        await _handleTokenRefreshFailure(errorModel.message);
      }
    } catch (e) {
      log('Unexpected error during token refresh: $e');
      await _handleTokenRefreshFailure('Unexpected error occurred');
    }
  }

  Future<void> _handleTokenRefreshFailure(String errorMessage) async {
    // Clear all stored tokens and user data
    await CacheHelper.deleteSecureData(key: AppConstants.accessToken);
    await CacheHelper.deleteSecureData(key: AppConstants.refreshToken);
    await CacheHelper.deleteSecureData(key: AppConstants.userId);
    await CacheHelper.deleteSecureData(key: AppConstants.email);
    await CacheHelper.delete(key: AppConstants.username);

    log('Cleared all user data due to token refresh failure');

    // Navigate to sign in page
    final navigatorKey = sl<GlobalKey<NavigatorState>>();
    final context = navigatorKey.currentContext;
    if (context != null && context.mounted) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(Routes.signIn, (route) => false);

      // Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Session expired. Please sign in again.'),
            backgroundColor: AppColors.red,
          ),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_text_styles.dart';

class LightTheme {
  static ThemeData get getLightTheme => ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.font28W600h1_1.copyWith(
        color: AppColors.textPrimary,
      ),
      headlineMedium: AppTextStyles.font25W600h1_1.copyWith(
        color: AppColors.textPrimary,
      ),
      bodyLarge: AppTextStyles.font17W500h1_1.copyWith(
        color: AppColors.textSecondary,
      ),
      bodyMedium: AppTextStyles.font15W400h1_4.copyWith(
        color: AppColors.textSecondary,
      ),
    ),
    cardColor: AppColors.lightGrey,
    

    
  );
}

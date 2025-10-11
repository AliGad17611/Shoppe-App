import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/constants/app_constants.dart';
import 'package:shoppe_app/core/routes/app_routes.dart';
import 'package:shoppe_app/core/routes/routes.dart';

import 'package:shoppe_app/core/theme/light_theme.dart';

class ShoppeApp extends StatelessWidget {
  const ShoppeApp({super.key, required this.appRoutes});

  final AppRoutes appRoutes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Shoppe App',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.getLightTheme,
          onGenerateRoute: appRoutes.generateRoute,
          home: FutureBuilder<String>(
            future: _determineInitialRoute(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              
              // Navigate to the determined route
              final initialRoute = snapshot.data ?? Routes.welcome;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed(initialRoute);
              });
              
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<String> _determineInitialRoute() async {
    try {
      // Check if access token exists in secure storage
      final accessToken = await CacheHelper.getSecureData(
        key: AppConstants.accessToken,
      );
      
      if (accessToken != null && accessToken.isNotEmpty) {
        // User is logged in, navigate to home
        return Routes.home;
      }
      
      // Check if onboarding key exists in shared preferences
      final onboardingCompleted = CacheHelper.getBool(
        key: AppConstants.onboardingKey,
      );
      
      if (onboardingCompleted == true) {
        // Onboarding completed, navigate to auth home
        return Routes.authHome;
      }
      
      // First time user, show welcome view
      return Routes.welcome;
    } catch (e) {
      // In case of any error, default to welcome view
      return Routes.welcome;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/routes/app_routes.dart';

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
        );
      },
    );
  }
}

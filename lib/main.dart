import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/cache/cache_helper.dart';
import 'package:shoppe_app/core/di/injection_container.dart' as di;
import 'package:shoppe_app/core/routes/app_routes.dart';
import 'package:shoppe_app/shoppe_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.init();
  // Initialize screen util
  await ScreenUtil.ensureScreenSize();
  // Initialize cache
  await CacheHelper.init();
  runApp(ShoppeApp(appRoutes: AppRoutes()));
}

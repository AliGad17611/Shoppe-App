import 'package:get_it/get_it.dart';
import 'package:shoppe_app/core/network/dio_factory.dart';
import 'package:shoppe_app/core/theme/cubit/theme_cubit.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_api_service.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/register_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_cubit.dart';
import 'package:shoppe_app/core/network/refresh_token_service.dart';
import 'package:shoppe_app/core/network/refresh_token_api_service.dart';
import 'package:flutter/material.dart';

final sl = GetIt.instance; // sl is short for service locator

Future<void> init() async {
  // ===== Features =====

  // Auth Feature
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => VerificationCubit(sl()));
  sl.registerFactory(() => ForgotPasswordCubit(sl()));
  sl.registerFactory(() => ResetPasswordCubit(sl()));

  // Auth Repository
  sl.registerLazySingleton(() => AuthRepository(sl()));

  // Auth Api Service
  sl.registerLazySingleton(() => AuthApiService(sl()));

  // ===== Core =====

  // Theme
  sl.registerLazySingleton(() => ThemeCubit());

  // Refresh Token API Service
  sl.registerLazySingleton(() => RefreshTokenApiService(sl()));

  // Refresh Token Service
  sl.registerLazySingleton(() => RefreshTokenService(sl()));

  // Global Navigator Key for navigation from services
  sl.registerLazySingleton(() => GlobalKey<NavigatorState>());

  // ===== External =====

  // Dio Factory
  sl.registerLazySingleton(() => DioFactory().dio);
}

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppe_app/core/network/network_info.dart';
import 'package:shoppe_app/core/theme/cubit/theme_cubit.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shoppe_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_facebook.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_twitter.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance; // sl is short for service locator

Future<void> init() async {
  // ===== Features =====

  // Auth Feature
  // Cubits
  sl.registerFactory(
    () => AuthCubit(
      signInWithGoogle: sl(),
      signInWithFacebook: sl(),
      signInWithTwitter: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignInWithFacebook(sl()));
  sl.registerLazySingleton(() => SignInWithTwitter(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // ===== Core =====

  // Theme
  sl.registerLazySingleton(() => ThemeCubit());

  // Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // ===== External =====

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

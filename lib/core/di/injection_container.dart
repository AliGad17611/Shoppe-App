import 'package:get_it/get_it.dart';
import 'package:shoppe_app/core/network/network_info.dart';
import 'package:shoppe_app/features/welcome/data/datasources/welcome_local_datasource.dart';
import 'package:shoppe_app/features/welcome/data/repositories/welcome_repository_impl.dart';
import 'package:shoppe_app/features/welcome/domain/repositories/welcome_repository.dart';
import 'package:shoppe_app/features/welcome/domain/usecases/complete_onboarding.dart';
import 'package:shoppe_app/features/welcome/domain/usecases/get_onboarding_items.dart';
import 'package:shoppe_app/features/welcome/presentation/cubit/welcome_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Welcome
  // Cubit
  sl.registerFactory(
    () => WelcomeCubit(getOnboardingItems: sl(), completeOnboarding: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetOnboardingItems(sl()));
  sl.registerLazySingleton(() => CompleteOnboarding(sl()));

  // Repository
  sl.registerLazySingleton<WelcomeRepository>(
    () => WelcomeRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<WelcomeLocalDataSource>(
    () => WelcomeLocalDataSourceImpl(),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // External
  // Add SharedPreferences, Dio, etc. here when needed
}

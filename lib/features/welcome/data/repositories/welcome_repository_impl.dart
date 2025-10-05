import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/exceptions.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/features/welcome/data/datasources/welcome_local_datasource.dart';
import 'package:shoppe_app/features/welcome/domain/entities/onboarding_item.dart';
import 'package:shoppe_app/features/welcome/domain/repositories/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  final WelcomeLocalDataSource localDataSource;

  WelcomeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<OnboardingItem>>> getOnboardingItems() async {
    try {
      final items = await localDataSource.getOnboardingItems();
      return Right(items);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> completeOnboarding() async {
    try {
      final result = await localDataSource.completeOnboarding();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final result = await localDataSource.isOnboardingCompleted();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}

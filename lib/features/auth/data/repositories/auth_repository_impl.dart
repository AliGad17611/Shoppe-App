import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/exceptions.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/core/network/network_info.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:shoppe_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:shoppe_app/features/auth/domain/entities/user.dart';
import 'package:shoppe_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithGoogle();
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return const Left(ServerFailure('An error occurred during sign in'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithFacebook();
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return const Left(ServerFailure('An error occurred during sign in'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithTwitter() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithTwitter();
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return const Left(ServerFailure('An error occurred during sign in'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithEmail(
          email: email,
          password: password,
        );
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return const Left(ServerFailure('An error occurred during sign in'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signUpWithEmail(
          email: email,
          password: password,
          name: name,
        );
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return const Left(ServerFailure('An error occurred during sign up'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCachedUser();
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure('Failed to sign out'));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
      return Right(cachedUser);
    } catch (e) {
      return const Left(CacheFailure('Failed to get cached user'));
    }
  }
}

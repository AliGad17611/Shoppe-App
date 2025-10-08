import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, User>> signInWithFacebook();
  Future<Either<Failure, User>> signInWithTwitter();
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User?>> getCurrentUser();
}


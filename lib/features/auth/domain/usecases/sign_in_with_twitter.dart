import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/core/usecases/usecase.dart';
import 'package:shoppe_app/features/auth/domain/entities/user.dart';
import 'package:shoppe_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithTwitter implements UseCase<User, NoParams> {
  final AuthRepository repository;

  SignInWithTwitter(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.signInWithTwitter();
  }
}


import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/core/usecases/usecase.dart';
import 'package:shoppe_app/features/welcome/domain/repositories/welcome_repository.dart';

class CompleteOnboarding implements UseCase<bool, NoParams> {
  final WelcomeRepository repository;

  CompleteOnboarding(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.completeOnboarding();
  }
}

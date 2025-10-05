import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/core/usecases/usecase.dart';
import 'package:shoppe_app/features/welcome/domain/entities/onboarding_item.dart';
import 'package:shoppe_app/features/welcome/domain/repositories/welcome_repository.dart';

class GetOnboardingItems implements UseCase<List<OnboardingItem>, NoParams> {
  final WelcomeRepository repository;

  GetOnboardingItems(this.repository);

  @override
  Future<Either<Failure, List<OnboardingItem>>> call(NoParams params) async {
    return await repository.getOnboardingItems();
  }
}

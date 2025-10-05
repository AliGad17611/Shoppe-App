import 'package:dartz/dartz.dart';
import 'package:shoppe_app/core/errors/failures.dart';
import 'package:shoppe_app/features/welcome/domain/entities/onboarding_item.dart';

abstract class WelcomeRepository {
  Future<Either<Failure, List<OnboardingItem>>> getOnboardingItems();
  Future<Either<Failure, bool>> completeOnboarding();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}

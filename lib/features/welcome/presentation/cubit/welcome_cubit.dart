import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/usecases/usecase.dart';
import 'package:shoppe_app/features/welcome/domain/usecases/complete_onboarding.dart';
import 'package:shoppe_app/features/welcome/domain/usecases/get_onboarding_items.dart';
import 'package:shoppe_app/features/welcome/presentation/cubit/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final GetOnboardingItems getOnboardingItems;
  final CompleteOnboarding completeOnboarding;

  WelcomeCubit({
    required this.getOnboardingItems,
    required this.completeOnboarding,
  }) : super(WelcomeInitial());

  Future<void> loadOnboardingItems() async {
    emit(WelcomeLoading());

    final result = await getOnboardingItems(NoParams());

    result.fold(
      (failure) => emit(WelcomeError(failure.message)),
      (items) => emit(WelcomeLoaded(items: items)),
    );
  }

  void nextPage() {
    if (state is WelcomeLoaded) {
      final currentState = state as WelcomeLoaded;
      if (currentState.currentIndex < currentState.items.length - 1) {
        emit(
          currentState.copyWith(currentIndex: currentState.currentIndex + 1),
        );
      }
    }
  }

  void previousPage() {
    if (state is WelcomeLoaded) {
      final currentState = state as WelcomeLoaded;
      if (currentState.currentIndex > 0) {
        emit(
          currentState.copyWith(currentIndex: currentState.currentIndex - 1),
        );
      }
    }
  }

  void setPage(int index) {
    if (state is WelcomeLoaded) {
      final currentState = state as WelcomeLoaded;
      emit(currentState.copyWith(currentIndex: index));
    }
  }

  Future<void> finishOnboarding() async {
    final result = await completeOnboarding(NoParams());

    result.fold(
      (failure) => emit(WelcomeError(failure.message)),
      (_) => emit(WelcomeCompleted()),
    );
  }
}

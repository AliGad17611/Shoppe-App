import 'package:equatable/equatable.dart';
import 'package:shoppe_app/features/welcome/domain/entities/onboarding_item.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object?> get props => [];
}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeLoaded extends WelcomeState {
  final List<OnboardingItem> items;
  final int currentIndex;

  const WelcomeLoaded({required this.items, this.currentIndex = 0});

  @override
  List<Object?> get props => [items, currentIndex];

  WelcomeLoaded copyWith({List<OnboardingItem>? items, int? currentIndex}) {
    return WelcomeLoaded(
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class WelcomeError extends WelcomeState {
  final String message;

  const WelcomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class WelcomeCompleted extends WelcomeState {}

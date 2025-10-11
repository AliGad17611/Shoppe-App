import 'package:equatable/equatable.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object?> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final String message;

  const VerificationSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class VerificationError extends VerificationState {
  final ApiErrorModel apiErrorModel;

  const VerificationError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

class VerificationResendLoading extends VerificationState {}

class VerificationResendSuccess extends VerificationState {
  final String message;

  const VerificationResendSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class VerificationResendError extends VerificationState {
  final ApiErrorModel apiErrorModel;

  const VerificationResendError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

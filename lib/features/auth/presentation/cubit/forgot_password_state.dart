import 'package:equatable/equatable.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  const ForgotPasswordSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ForgotPasswordError extends ForgotPasswordState {
  final ApiErrorModel apiErrorModel;

  const ForgotPasswordError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

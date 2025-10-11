import 'package:equatable/equatable.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  const ResetPasswordSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordError extends ResetPasswordState {
  final ApiErrorModel apiErrorModel;

  const ResetPasswordError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

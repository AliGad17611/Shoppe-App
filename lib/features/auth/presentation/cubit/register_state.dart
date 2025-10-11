import 'package:equatable/equatable.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  const RegisterSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterError extends RegisterState {
  final ApiErrorModel apiErrorModel;

  const RegisterError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

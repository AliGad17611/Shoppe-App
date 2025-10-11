import 'package:equatable/equatable.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final ApiErrorModel apiErrorModel;

  const LoginError({required this.apiErrorModel});

  @override
  List<Object?> get props => [apiErrorModel];
}

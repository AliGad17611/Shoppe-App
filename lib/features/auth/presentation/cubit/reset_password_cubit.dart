import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';
import 'package:shoppe_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordCubit(this._authRepository) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword != confirmPassword) {
      emit(
        ResetPasswordError(
          apiErrorModel: ApiErrorModel(
            message: 'Passwords do not match',
            icon: Icons.error,
            statusCode: 400,
            errors: ['Passwords do not match'],
          ),
        ),
      );
      return;
    }

    emit(ResetPasswordLoading());

    final request = ResetPasswordRequestModel(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );

    final result = await _authRepository.resetPassword(request);

    result.fold(
      (error) {
        emit(ResetPasswordError(apiErrorModel: error));
      },
      (response) {
        emit(ResetPasswordSuccess(message: response));
      },
    );
  }
}

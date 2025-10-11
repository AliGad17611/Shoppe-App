import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/errors/api_error_model.dart';
import 'package:shoppe_app/features/auth/data/models/resend_code_request_model.dart';
import 'package:shoppe_app/features/auth/data/models/verification_request_model.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepository _authRepository;

  VerificationCubit(this._authRepository) : super(VerificationInitial());

  Future<void> verifyCode({required String email, required String code}) async {
    try {
      log('VerificationCubit: Starting verification for email: $email');
      emit(VerificationLoading());

      final request = VerificationRequestModel(email: email, otp: code);

      log('VerificationCubit: Calling repository verifyCode');
      final result = await _authRepository.verifyCode(request);

      result.fold(
        (error) {
          log('VerificationCubit: Error received: ${error.message}');
          emit(VerificationError(apiErrorModel: error));
        },
        (response) {
          log('VerificationCubit: Success received: $response');
          emit(VerificationSuccess(message: response));
        },
      );
    } catch (e, stackTrace) {
      log('VerificationCubit: Unexpected error in verifyCode: $e');
      log('VerificationCubit: Stack trace: $stackTrace');
      // Handle the error properly instead of rethrowing
      final errorModel = ApiErrorModel(
        message: 'An unexpected error occurred during verification',
        icon: Icons.error,
        statusCode: 500,
        errors: [e.toString()],
      );
      emit(VerificationError(apiErrorModel: errorModel));
    }
  }

  Future<void> resendCode({required String email}) async {
    emit(VerificationResendLoading());

    final request = ResendCodeRequestModel(email: email);

    final result = await _authRepository.resendVerificationCode(request);
    result.fold(
      (error) => emit(VerificationResendError(apiErrorModel: error)),
      (response) => emit(VerificationResendSuccess(message: response)),
    );
  }
}

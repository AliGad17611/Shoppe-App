
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/features/auth/data/models/resend_code_request_model.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository) : super(ForgotPasswordInitial());

  Future<void> sendResetOtp({required String email}) async {
 
      emit(ForgotPasswordLoading());

      final request = ResendCodeRequestModel(email: email);

      final result = await _authRepository.sendResetOtp(request);

      result.fold(
        (error) {
          emit(ForgotPasswordError(apiErrorModel: error));
        },
        (response) {
          emit(ForgotPasswordSuccess(message: response));
        },
      );
  }
}
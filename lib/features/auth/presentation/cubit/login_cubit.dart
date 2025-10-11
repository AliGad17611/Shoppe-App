import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/features/auth/data/models/login_request_model.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

      final request = LoginRequestModel(email: email, password: password);

      final result = await _authRepository.login(request);
      result.fold(
        (error) => emit(LoginError(apiErrorModel: error)),
        (response) => emit(LoginSuccess()),
      );
  }
}

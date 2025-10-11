import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/features/auth/data/models/register_request_model.dart';
import 'package:shoppe_app/features/auth/data/repositories/auth_repository.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());

    final request = RegisterRequestModel(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    final result = await _authRepository.register(request);
    result.fold(
      (error) => emit(RegisterError(apiErrorModel: error)),
      (response) => emit(RegisterSuccess(message: response.message)),
    );
  }
}

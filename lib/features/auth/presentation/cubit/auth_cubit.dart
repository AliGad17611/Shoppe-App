import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/usecases/usecase.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_facebook.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:shoppe_app/features/auth/domain/usecases/sign_in_with_twitter.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithGoogle signInWithGoogle;
  final SignInWithFacebook signInWithFacebook;
  final SignInWithTwitter signInWithTwitter;

  AuthCubit({
    required this.signInWithGoogle,
    required this.signInWithFacebook,
    required this.signInWithTwitter,
  }) : super(AuthInitial());

  Future<void> signInGoogle() async {
    emit(AuthLoading());
    final result = await signInWithGoogle(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> signInFacebook() async {
    emit(AuthLoading());
    final result = await signInWithFacebook(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> signInTwitter() async {
    emit(AuthLoading());
    final result = await signInWithTwitter(NoParams());
    result.fold(
      (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  String _mapFailureToMessage(failure) {
    return 'Something went wrong. Please try again.';
  }
}


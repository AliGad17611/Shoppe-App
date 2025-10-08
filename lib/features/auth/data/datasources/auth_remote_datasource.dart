import 'package:shoppe_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
  Future<UserModel> signInWithTwitter();
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // TODO: Add Firebase Auth or your auth provider here
  // For now, these are mock implementations

  @override
  Future<UserModel> signInWithGoogle() async {
    // TODO: Implement Google Sign-In
    await Future.delayed(const Duration(seconds: 1));
    throw UnimplementedError('Google Sign-In not yet implemented');
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    // TODO: Implement Facebook Sign-In
    await Future.delayed(const Duration(seconds: 1));
    throw UnimplementedError('Facebook Sign-In not yet implemented');
  }

  @override
  Future<UserModel> signInWithTwitter() async {
    // TODO: Implement Twitter Sign-In
    await Future.delayed(const Duration(seconds: 1));
    throw UnimplementedError('Twitter Sign-In not yet implemented');
  }

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    // TODO: Implement Email Sign-In
    await Future.delayed(const Duration(seconds: 1));
    throw UnimplementedError('Email Sign-In not yet implemented');
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    // TODO: Implement Email Sign-Up
    await Future.delayed(const Duration(seconds: 1));
    throw UnimplementedError('Email Sign-Up not yet implemented');
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement Sign-Out
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // TODO: Implement Get Current User
    return null;
  }
}


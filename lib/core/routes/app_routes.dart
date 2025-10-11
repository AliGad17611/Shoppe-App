import 'package:flutter/material.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/features/auth/presentation/views/auth_home_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/email_verification_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/verification_view.dart';
import 'package:shoppe_app/features/home/presentation/views/home_views.dart';
import 'package:shoppe_app/features/welcome/presentation/views/welcome_view.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.authHome:
        return MaterialPageRoute(builder: (_) => const AuthHomeView());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.verification:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>
              VerificationView(type: args!['type'], email: args['email']),
        );
      case Routes.emailVerification:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => EmailVerificationView(email: args!['email']),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.resetPassword:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView(email: args!['email']),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

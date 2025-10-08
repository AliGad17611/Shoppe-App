import 'package:flutter/material.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/features/auth/presentation/views/auth_home_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:shoppe_app/features/auth/presentation/views/sign_up_view.dart';
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

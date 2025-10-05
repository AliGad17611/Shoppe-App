import 'package:flutter/material.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/features/home/presentation/views/home_views.dart';
import 'package:shoppe_app/features/welcome/presentation/views/welcome_view.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
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

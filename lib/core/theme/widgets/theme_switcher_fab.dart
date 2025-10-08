import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/theme/cubit/theme_cubit.dart';
import 'package:shoppe_app/core/theme/cubit/theme_mode.dart';
import 'package:shoppe_app/core/theme/cubit/theme_state.dart';

/// A floating action button that cycles through themes
/// Usage: Add as floatingActionButton in your Scaffold
class ThemeSwitcherFAB extends StatelessWidget {
  const ThemeSwitcherFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        IconData icon;
        switch (state.themeMode) {
          case AppThemeMode.light:
            icon = Icons.light_mode;
          case AppThemeMode.dark:
            icon = Icons.dark_mode;
          case AppThemeMode.blue:
            icon = Icons.water_drop;
        }

        return FloatingActionButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          tooltip: 'Change Theme',
          child: Icon(icon),
        );
      },
    );
  }
}



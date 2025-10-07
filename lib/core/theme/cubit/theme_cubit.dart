import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppe_app/core/theme/cubit/theme_mode.dart';
import 'package:shoppe_app/core/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'app_theme_mode';

  ThemeCubit() : super(const ThemeState(themeMode: AppThemeMode.light)) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeName = prefs.getString(_themeKey);
      if (themeName != null) {
        final themeMode = AppThemeModeExtension.fromString(themeName);
        emit(ThemeState(themeMode: themeMode));
      }
    } catch (e) {
      // If loading fails, keep the default theme
      emit(const ThemeState(themeMode: AppThemeMode.light));
    }
  }

  Future<void> changeTheme(AppThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, themeMode.name);
      emit(ThemeState(themeMode: themeMode));
    } catch (e) {
      // Handle error if needed
    }
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.themeMode;
    AppThemeMode newTheme;

    switch (currentTheme) {
      case AppThemeMode.light:
        newTheme = AppThemeMode.dark;
        break;
      case AppThemeMode.dark:
        newTheme = AppThemeMode.blue;
        break;
      case AppThemeMode.blue:
        newTheme = AppThemeMode.light;
        break;
    }

    await changeTheme(newTheme);
  }
}

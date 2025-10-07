enum AppThemeMode { light, dark, blue }

extension AppThemeModeExtension on AppThemeMode {
  String get name {
    switch (this) {
      case AppThemeMode.light:
        return 'light';
      case AppThemeMode.dark:
        return 'dark';
      case AppThemeMode.blue:
        return 'blue';
    }
  }

  static AppThemeMode fromString(String value) {
    switch (value) {
      case 'dark':
        return AppThemeMode.dark;
      case 'blue':
        return AppThemeMode.blue;
      default:
        return AppThemeMode.light;
    }
  }
}

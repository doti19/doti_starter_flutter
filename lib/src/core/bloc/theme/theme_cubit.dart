import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:doti_starter/src/core/bloc/theme/app_theme.dart';
import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/repository/repository.dart';

final Map<AppTheme, ThemeData> themeData = {
  AppTheme.system: Style.light,
  AppTheme.light: Style.light,
  AppTheme.dark: Style.dark,
};

/// Saves and loads information regarding the theme setting.
class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit(this.themeRepository) : super(defaultTheme);

  final ThemeRepository themeRepository;

  static const defaultTheme = AppTheme.system;

  Future<void> loadTheme() async {
    final savedTheme = await themeRepository.getTheme();
    emit(savedTheme);
  }

  AppTheme get theme => state;

  set setTheme(AppTheme theme) {
    themeRepository.saveTheme(theme);
    emit(theme);
  }

  void updateTheme(AppTheme value) => setTheme = value;

  /// Returns appropriate theme mode
  ThemeMode get themeMode {
    switch (state) {
      case AppTheme.experimental:
      case AppTheme.light:
      case AppTheme.yellow:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Default theme
  ThemeData getDefaultTheme() {
    switch (state) {
      case AppTheme.light:
        return themeData[AppTheme.light] ?? Style.light;
      case AppTheme.dark:
        return themeData[AppTheme.dark] ?? Style.dark;
      case AppTheme.yellow:
        return themeData[AppTheme.yellow] ?? Style.light;
      case AppTheme.system:
        return themeData[AppTheme.system] ?? Style.light;
      case AppTheme.experimental:
        return themeData[AppTheme.experimental] ?? Style.light;
    }
  }

  /// Default dark theme
  ThemeData get darkTheme => themeData[AppTheme.dark] ?? Style.dark;
}

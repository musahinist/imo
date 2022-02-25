part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  factory ThemeState.lightTheme() {
    return ThemeState(themeMode: ThemeMode.light);
  }

  factory ThemeState.darkTheme() {
    return ThemeState(themeMode: ThemeMode.dark);
  }

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

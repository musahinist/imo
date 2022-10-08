part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  factory ThemeState.lightTheme() => ThemeState(themeMode: ThemeMode.light);

  factory ThemeState.darkTheme() => ThemeState(themeMode: ThemeMode.dark);

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
      );
}

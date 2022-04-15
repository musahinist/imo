import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);
  void changeThemeMode(ThemeMode themeMode) => emit(themeMode);
}

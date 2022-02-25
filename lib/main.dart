import 'package:flutter/material.dart';
import 'package:imo/src/feature/auth/bloc/login_bloc.dart';
import 'package:imo/src/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imo/src/config/theme/cubit/theme_cubit.dart';

import 'src/app.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final appRouter = AppRouter();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc()..add(LoginEvent()),
        ),
      ],
      child: MyApp(
        appRouter: appRouter,
      ),
    ),
  );
}

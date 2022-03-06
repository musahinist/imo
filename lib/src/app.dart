import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imo/src/config/style/app_theme.dart';
import 'package:imo/src/feature/auth/presentation/bloc/auth/auth_bloc.dart';

import 'package:imo/src/router/router.dart';

import 'feature/auth/presentation/bloc/login/login_bloc.dart';
import 'feature/settings/theme/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    // Hive.box('shortLinkBox').clear();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, auth) {
        if (auth.state == AuthStatus.authenticating ||
            auth.state == AuthStatus.initial) {
          appRouter.pushAndPopUntil(
            const SplashRoute(),
            predicate: (route) => false,
          );
        }
        if (auth.state == AuthStatus.authenticated) {
          appRouter.pushAndPopUntil(
            const ShortenRoute(),
            predicate: (route) => false,
          );
        }
        if (auth.state == AuthStatus.unauthenticated) {
          appRouter.pushAndPopUntil(
            const LandingRoute(),
            predicate: (route) => false,
          );
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, theme) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: () {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                onGenerateTitle: (BuildContext context) =>
                    AppLocalizations.of(context)!.appTitle,
                theme: CreateTheme.lightTheme,
                darkTheme: CreateTheme.darkTheme,
                themeMode: theme.themeMode,
                routerDelegate: appRouter.delegate(),
                routeInformationParser: appRouter.defaultRouteParser(),
              );
            },
          );
        },
      ),
    );
  }
}

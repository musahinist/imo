import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/style/theme.dart';
import '../feature/auth/presentation/bloc/auth/auth_bloc.dart';
import '../feature/home/presentation/cubit/task_cubit.dart';
import '../feature/settings/theme/cubit/theme_cubit.dart';
import 'router/router.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hive.box('shortLinkBox').clear();
    return MultiBlocProvider(
      providers: providers(context),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, auth) {
          if (auth.state == AuthStatus.authenticating ||
              auth.state == AuthStatus.initial) {
            appRouter.pushAndPopUntil(
              const SplashRoute(),
              predicate: (route) => false,
            );
          }
          if (auth.state == AuthStatus.unauthenticated) {
            appRouter.replaceAll([const LandingRoute()]);
          }
          if (auth.state == AuthStatus.authenticated) {
            appRouter.replaceAll([const HomeRoute()]);
          }
        },
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, theme) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              builder: (context, widget) {
                return MaterialApp.router(
                  scaffoldMessengerKey: scaffoldMessengerKey,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  onGenerateTitle: (BuildContext context) =>
                      AppLocalizations.of(context).appTitle,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: theme.themeMode,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<BlocProvider> providers(BuildContext context) => [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(context.read(), context.read())
            ..add(const AuthChangedEvent()),
        ),
        BlocProvider(
          create: (context) => TaskCubit(context.read()),
        )
      ];
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imo/src/feature/auth/bloc/login_bloc.dart';
import 'package:imo/src/feature/settings/theme/cubit/theme_cubit.dart';
import 'package:imo/src/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/core/di/injection_container.dart';
import 'src/feature/shorten/data/model/short_link.dart';

late Box<ShortLink> box;
Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  await Hive.initFlutter();

  Hive.registerAdapter(ShortLinkAdapter());
  box = await Hive.openBox<ShortLink>('shortLinkBox');
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  BlocOverrides.runZoned(
    () async => {
      runApp(
        MultiRepositoryProvider(
          providers: await DI.init(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ThemeCubit(),
              ),
              BlocProvider(
                create: (context) => LoginBloc()..add(const LoginEvent(false)),
              ),
            ],
            child: MyApp(
              appRouter: appRouter,
            ),
          ),
        ),
      )
    },
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (kDebugMode) {
      print('onChange -- ${bloc.runtimeType}, $change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    if (kDebugMode) {
      print('onClose -- ${bloc.runtimeType}');
    }
  }
}

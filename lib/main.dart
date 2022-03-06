import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/core/bloc/bloc_observer.dart';
import 'src/core/di/injection_container.dart';
import 'src/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'src/feature/settings/theme/cubit/theme_cubit.dart';
import 'src/feature/shorten/data/model/short_link.dart';
import 'src/router/router.dart';

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
                create: (context) => AuthBloc()..add(const AuthChangedEvent()),
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

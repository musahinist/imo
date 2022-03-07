import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/core/bloc/bloc_observer.dart';
import 'src/core/di/injection_container.dart';
import 'src/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'src/feature/settings/theme/cubit/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

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
            child: const MyApp(),
          ),
        ),
      )
    },
    blocObserver: AppBlocObserver(),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/product/app.dart';
import 'src/core/bloc/bloc_observer.dart';
import 'src/core/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Bloc.observer = AppBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: await DI.init(),
      child: const App(),
    ),
  );
}

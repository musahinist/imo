import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imo/src/feature/auth/data/source/auth_repository_impl.dart';
import 'package:imo/src/feature/shorten/data/source/local/link_box.service.dart';

import '../../feature/auth/domain/auth_repository.dart';
import '../../feature/shorten/data/source/remote/link_repository_impl.dart';
import '../../feature/shorten/domain/link_repository.dart';

class DI {
  const DI._();
  static Future<List<RepositoryProvider>> init({isTesting = false}) async {
    final linkRepository = LinkRepositoryImpl();
    final linkBox = LinkBox();
    final authRepository = AuthRepositoryImpl();
    return [
      RepositoryProvider<LinkRepository>(
        create: (context) => linkRepository,
      ),
      RepositoryProvider<LinkBox>(
        create: (context) => linkBox,
      ),
      RepositoryProvider<AuthRepository>(
        create: (context) => authRepository,
      ),
    ];
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/auth/data/source/auth_repository_impl.dart';
import '../../../feature/auth/data/source/token_repository_local.dart';
import '../../../feature/auth/data/source/user_repostory_impl.dart';
import '../../../feature/auth/domain/auth_repository.dart';
import '../../../feature/auth/domain/user_repository.dart';
import '../../../feature/home/data/source/task_repository_mock.dart';
import '../../../feature/home/domain/task_repostory.dart';
import '../../../feature/shorten/data/source/local/link_box.service.dart';
import '../../../feature/shorten/data/source/remote/link_repository_impl.dart';
import '../../../feature/shorten/domain/link_repository.dart';

class DependencyInjectionProduct {
  final LinkRepository linkRepository = LinkRepositoryImpl();
  final TokenRepositoryLocal tokenRepository = TokenRepositoryLocal();
  final AuthRepository authRepository = AuthRepositoryImpl();
  final UserRepository userRepository = UserRepositoryImpl();
  final TaskRepository taskRepository = TaskRepositoryMock();
  final LinkBox linkBox = LinkBox();

  Future<List<RepositoryProvider<dynamic>>> getProductDependency() async {
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
      RepositoryProvider<UserRepository>(
        create: (context) => userRepository,
      ),
      RepositoryProvider<TokenRepositoryLocal>(
        create: (context) => tokenRepository,
      ),
      RepositoryProvider<TaskRepository>(
        create: (context) => taskRepository,
      ),
    ];
  }
}

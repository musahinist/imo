import 'package:imo/src/feature/auth/domain/user_repository.dart';

import '../../../../core/http/base_api.dart';
import '../../../../product/config/enum/api_inner_path.dart';
import '../../../../product/config/enum/api_path.dart';

class UserRepositoryImpl extends UserRepository {
  final BaseApi _client;

  UserRepositoryImpl() : _client = BaseApi(path: ApiPath.user.path);

  @override
  Future getUser() async {
    try {
      final response = await _client.get(
        innerPath: ApiInnerPath.me.path,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

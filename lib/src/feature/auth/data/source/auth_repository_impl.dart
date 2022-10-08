import '../../../../core/http/base_api.dart';
import '../../../../product/config/enum/api_inner_path.dart';
import '../../../../product/config/enum/api_path.dart';
import '../../../../product/config/enum/json_key.dart';
import '../../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BaseApi _client;

  AuthRepositoryImpl() : _client = BaseApi(path: ApiPath.auth.path);

  @override
  Future<String> login(String email, String pass) async {
    try {
      final response = await _client.post(
        innerPath: ApiInnerPath.login.path,
        data: {
          JsonKey.email.key: email,
          JsonKey.password.key: pass,
        },
      );

      return response.data[JsonKey.accessToken.key];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp(String email, String pass) async {
    try {
      final response = await _client.post(
        innerPath: ApiInnerPath.signup.path,
        data: {
          JsonKey.email.key: email,
          JsonKey.password.key: pass,
        },
      );
      return response.data[JsonKey.accessToken.key];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

import '../../../../core/http/base_api.dart';
import '../../domain/auth_repository.dart';
import 'token_repository_local.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BaseApi _client;
  final TokenRepositoryLocal _local = TokenRepositoryLocal();
  AuthRepositoryImpl() : _client = BaseApi(path: 'auth');

  @override
  Future<String> login(String email, String pass) async {
    try {
      final response = await _client.post(
        innerPath: 'signin',
        data: {'email': email, 'password': pass},
      );
      _local.saveToken(response.data['access_token']);
      BaseApi.token = response.data['access_token'];
      return response.data['access_token'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp(String email, String pass) async {
    try {
      final response = await _client.post(
        innerPath: 'signup',
        data: {'email': email, 'password': pass},
      );
      return response.data['access_token'];
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

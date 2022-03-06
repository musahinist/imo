import 'package:imo/src/core/http/base_api.dart';

import '../../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BaseApi _client;
  AuthRepositoryImpl() : _client = BaseApi(path: 'auth');

  @override
  Future login(String email, String pass) async {
    try {
      final response = await _client.post(
        innerPath: 'signin',
        data: {'email': email, 'password': pass},
      );
      return response.data['access_token'];
    } catch (e) {
      rethrow;
    }
  }
}

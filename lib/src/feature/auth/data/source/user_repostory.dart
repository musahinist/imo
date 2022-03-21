import '../../../../core/http/base_api.dart';

class UserRepositoryImpl {
  final BaseApi _client;

  UserRepositoryImpl() : _client = BaseApi(path: 'user');

  Future getUuser() async {
    try {
      final response = await _client.get(
        innerPath: 'me',
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

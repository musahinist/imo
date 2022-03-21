import 'package:hive/hive.dart';

class TokenRepositoryLocal {
  TokenRepositoryLocal();

  final box = Hive.box('tokenBox');

  Future<void> saveToken(String token) async {
    await box.put('token', token);
  }

  String getToken() {
    return box.get('token');
  }

  Future<void> deleteToken() async {
    await box.delete('token');
  }

  bool hasToken() {
    return box.containsKey('token');
  }

  Future<void> clear() async {
    await box.clear();
  }

  closeBox() {
    box.close();
  }

  Future<void> deleteAll() async {
    await box.deleteFromDisk();
  }
}

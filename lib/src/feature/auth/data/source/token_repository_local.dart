import 'package:hive/hive.dart';

import '../../../../core/enum/hive_box.dart';

class TokenRepositoryLocal {
  TokenRepositoryLocal();

  final box = Hive.box(HiveBox.token.key);

  Future<void> saveToken(String token) async {
    await box.put(HiveBox.token.key, token);
  }

  String getToken() {
    return box.get(HiveBox.token.key);
  }

  Future<void> deleteToken() async {
    await box.delete(HiveBox.token.key);
  }

  bool hasToken() {
    return box.containsKey(HiveBox.token.key);
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

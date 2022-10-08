import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:imo/src/core/enum/hive_box.dart';
import 'package:imo/src/product/config/di/dependency_injection.dart';

import '../../feature/shorten/data/model/short_link.dart';

class DI {
  const DI._();
  static Future<List<RepositoryProvider>> init({isTesting = false}) async {
    Hive.registerAdapter(ShortLinkAdapter());
    await Hive.openBox<ShortLink>('shortLinkBox');
    await Hive.openBox(HiveBox.tokenBox.key);

    return DependencyInjectionProduct().getProductDependency();
  }
}

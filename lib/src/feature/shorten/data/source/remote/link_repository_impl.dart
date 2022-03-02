import 'package:dio/dio.dart';
import 'package:imo/src/core/http/base_api.dart';
import 'package:imo/src/feature/shorten/data/model/link_info.dart';
import 'package:imo/src/feature/shorten/data/model/short_link.dart';

import '../../../../../core/http/base_response.dart';
import '../../../domain/link_repository.dart';

class LinkRepositoryImpl extends BaseApi implements LinkRepository {
  LinkRepositoryImpl();

  @override
  Future<ShortLink> shortenLink(String url) async {
    try {
      final Response response =
          await get(innerPath: 'shorten', queryParams: {'url': url});
      Res res = Res.fromJson(response.data);
      return ShortLink.fromJson(res.result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LinkInfo> getInfo(String shortenedLink) async {
    try {
      final Response response =
          await get(innerPath: 'info', queryParams: {'code': shortenedLink});
      Res res = Res.fromJson(response.data);
      return LinkInfo.fromJson(res.result);
    } catch (e) {
      rethrow;
    }
  }
}

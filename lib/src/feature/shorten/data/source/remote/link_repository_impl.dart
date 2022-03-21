import 'package:dio/dio.dart';
import '../../../../../core/http/base_api.dart';
import '../../model/link_info.dart';
import '../../model/short_link.dart';

import '../../../../../core/http/base_response.dart';
import '../../../domain/link_repository.dart';

class LinkRepositoryImpl implements LinkRepository {
  final BaseApi _client;
  LinkRepositoryImpl() : _client = BaseApi();

  @override
  Future<ShortLink> shortenLink(String url) async {
    try {
      final Response response =
          await _client.get(innerPath: 'shorten', queryParams: {'url': url});
      Res res = Res.fromJson(response.data);
      return ShortLink.fromJson(res.result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LinkInfo> getInfo(String shortenedLink) async {
    try {
      final Response response = await _client
          .get(innerPath: 'info', queryParams: {'code': shortenedLink});
      Res res = Res.fromJson(response.data);
      return LinkInfo.fromJson(res.result);
    } catch (e) {
      rethrow;
    }
  }
}

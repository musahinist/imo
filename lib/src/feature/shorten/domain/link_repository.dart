import '../data/model/link_info.dart';
import '../data/model/short_link.dart';

abstract class LinkRepository {
  Future<ShortLink> shortenLink(String link);
  Future<LinkInfo> getInfo(String shortenedLink);
}

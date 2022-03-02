import 'package:imo/src/feature/shorten/data/model/link_info.dart';
import 'package:imo/src/feature/shorten/data/model/short_link.dart';

abstract class LinkRepository {
  Future<ShortLink> shortenLink(String link);
  Future<LinkInfo> getInfo(String shortenedLink);
}

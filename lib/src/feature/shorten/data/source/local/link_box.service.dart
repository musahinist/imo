import 'package:imo/main.dart';
import 'package:imo/src/feature/shorten/data/model/short_link.dart';

class LinkBox {
  addLink(ShortLink link) {
    box.add(link);
  }

  deleteLink(ShortLink link) {
    link.delete();
  }

  List<ShortLink> getLinkList() {
    List<ShortLink> linkList = box.values.toList();

    return linkList;
  }
}

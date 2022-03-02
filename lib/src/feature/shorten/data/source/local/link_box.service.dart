import 'package:hive_flutter/hive_flutter.dart';
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
    print(linkList);
    return linkList;
  }
}

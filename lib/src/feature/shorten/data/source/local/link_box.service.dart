import 'package:hive/hive.dart';

import '../../model/short_link.dart';

class LinkBox {
  final Box<ShortLink> box = Hive.box('shortLinkBox');
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

  closeBox() {
    box.close();
  }
}

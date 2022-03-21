import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/short_link.dart';
import '../../domain/link_repository.dart';

import '../../data/source/local/link_box.service.dart';

part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  final LinkRepository linkRepository;
  final LinkBox linkBox;
  LinkBloc(this.linkRepository, this.linkBox)
      : super(LinkState(
            state: GetLinkState.initial,
            shortLinkList: const [],
            shortLink: ShortLink())) {
    on<GetLinkList>((event, emit) {
      List<ShortLink> linkList = linkBox.getLinkList();
      emit(state.copyWith(shortLinkList: linkList));
    });
    on<LinkShortenTappedEvent>((event, emit) async {
      emit(state.copyWith(state: GetLinkState.loading));
      try {
        final shortLink = await linkRepository.shortenLink(event.link);

        linkBox.addLink(shortLink);
        List<ShortLink> linkList = linkBox.getLinkList();
        emit(state.copyWith(
            state: GetLinkState.loaded,
            shortLinkList: linkList,
            shortLink: shortLink));
      } catch (e) {
        emit(state.copyWith(state: GetLinkState.error));
      }
    });
    on<DeleteLink>((event, emit) {
      linkBox.deleteLink(event.link);
      List<ShortLink> linkList = linkBox.getLinkList();
      emit(
          state.copyWith(shortLinkList: linkList, state: GetLinkState.deleted));
    });
  }
}

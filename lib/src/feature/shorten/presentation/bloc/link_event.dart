part of 'link_bloc.dart';

abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object> get props => [];
}

class GetLinkList extends LinkEvent {}

class DeleteLink extends LinkEvent {
  final ShortLink link;
  const DeleteLink(this.link);
  @override
  List<Object> get props => [link];
}

class LinkShortenTappedEvent extends LinkEvent {
  final String link;
  const LinkShortenTappedEvent({required this.link});
  @override
  List<Object> get props => [link];
}

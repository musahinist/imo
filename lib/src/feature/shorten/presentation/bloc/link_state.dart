part of 'link_bloc.dart';

enum GetLinkState { initial, loading, loaded, deleted, error }

class LinkState extends Equatable {
  final GetLinkState state;
  final List<ShortLink> shortLinkList;
  final ShortLink shortLink;
  const LinkState({
    required this.state,
    required this.shortLinkList,
    required this.shortLink,
  });

  @override
  List<Object> get props => [state, shortLinkList, shortLink];

  LinkState copyWith({
    GetLinkState? state,
    List<ShortLink>? shortLinkList,
    ShortLink? shortLink,
  }) {
    return LinkState(
      state: state ?? this.state,
      shortLinkList: shortLinkList ?? this.shortLinkList,
      shortLink: shortLink ?? this.shortLink,
    );
  }
}

// class LinkInitial extends LinkState {}

// class LinkListLoaded extends LinkState {
//   final List shortLinkList;

//   const LinkListLoaded({required this.shortLinkList});

//   @override
//   List<Object> get props => [shortLinkList];
// }

// class LinkShortening extends LinkState {}

// class LinkShortened extends LinkState {
//   final ShortLink shortLink;

//   const LinkShortened({required this.shortLink});

//   @override
//   List<Object> get props => [shortLink];
// }

// class LinkShorteningError extends LinkState {
//   final String error;

//   const LinkShorteningError({required this.error});

//   @override
//   List<Object> get props => [error];
// }

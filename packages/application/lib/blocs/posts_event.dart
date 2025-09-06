part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends PostsEvent {
  const _Init(this.userId);

  final String userId;

  @override
  List<Object?> get props => _$props;
}

extension PostsBlocX on PostsBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final PostsBloc _bloc;

  void init(String userId) {
    _bloc.add(_Init(userId));
  }
}

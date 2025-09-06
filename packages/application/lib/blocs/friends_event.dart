part of 'friends_bloc.dart';

abstract class FriendsEvent extends Equatable {
  const FriendsEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends FriendsEvent {
  const _Init(this.userId);

  final String userId;

  @override
  List<Object?> get props => _$props;
}

class _Fetch extends FriendsEvent {
  const _Fetch();
}

extension FriendsBlocX on FriendsBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final FriendsBloc _bloc;

  void init(String userId) {
    _bloc.add(_Init(userId));
  }

  void fetch() {
    _bloc.add(const _Fetch());
  }
}

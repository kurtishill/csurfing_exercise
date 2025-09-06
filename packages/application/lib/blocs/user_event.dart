part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends UserEvent {
  const _Init(this.userId);

  final String userId;

  @override
  List<Object?> get props => _$props;
}

extension UserBlocX on UserBloc {
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final UserBloc _bloc;

  void init(String userId) {
    _bloc.add(_Init(userId));
  }
}

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'user_bloc.g.dart';
part 'user_event.dart';
part 'user_state.dart';

typedef _Emitter = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required IUsersSource usersSource,
  }) : _usersSource = usersSource,
       super(const _Loading()) {
    on<_Init>(_init);
  }

  final IUsersSource _usersSource;

  late String _userId;

  Future<void> _init(_Init event, _Emitter emit) async {
    _userId = event.userId;

    final user = await _usersSource.byId(_userId);

    if (user == null) {
      emit(const _Error('User not found'));
      return;
    }

    emit(_Ready(user));
  }
}

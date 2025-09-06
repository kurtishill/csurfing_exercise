import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'friends_bloc.g.dart';
part 'friends_event.dart';
part 'friends_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<FriendsState>;

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc({
    required IFriendsSource friendsSource,
  }) : _friendsSource = friendsSource,
       super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch);
  }

  late final IFriendsSource _friendsSource;

  late String _userId;

  Future<void> _init(_Init event, _Emitter emit) async {
    _userId = event.userId;

    final friends = await _friendsSource.all(_userId);

    emit(_Ready(friends));
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    emit(const _Loading());

    final friends = await _friendsSource.all(_userId);

    emit(_Ready(friends));
  }
}

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'posts_bloc.g.dart';
part 'posts_event.dart';
part 'posts_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<PostsState>;

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({
    required IPostsSource postsSource,
  }) : _postsSource = postsSource,
       super(const _Loading()) {
    on<_Init>(_init);
  }

  final IPostsSource _postsSource;

  late String _userId;

  Future<void> _init(_Init event, _Emitter emit) async {
    _userId = event.userId;

    final posts = await _postsSource.all(_userId);

    emit(_Ready(posts));
  }
}

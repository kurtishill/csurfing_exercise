// ignore_for_file: cascade_invocations

import 'package:application/application.dart';
import 'package:get_it/get_it.dart';

void di(GetIt getIt) {
  getIt.registerFactory(
    () => FriendsBloc(
      friendsSource: getIt(),
    ),
  );

  getIt.registerFactory(
    () => PostsBloc(
      postsSource: getIt(),
    ),
  );

  getIt.registerFactory(
    () => UserBloc(
      usersSource: getIt(),
    ),
  );
}

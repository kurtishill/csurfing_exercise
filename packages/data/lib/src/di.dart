// ignore_for_file: cascade_invocations

import 'package:data/repos/repos.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

void di(GetIt getIt) {
  getIt.registerLazySingleton<IFriendsSource>(FriendsSource.new);

  getIt.registerLazySingleton<IPostsSource>(PostsSource.new);

  getIt.registerLazySingleton<IUsersSource>(UsersSource.new);
}

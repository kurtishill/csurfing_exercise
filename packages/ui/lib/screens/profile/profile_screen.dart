import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/screens/profile/profile_view.dart';
import 'package:ui/src/setup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(this.userId, {super.key});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<UserBloc>()..events.init(userId),
        ),
        BlocProvider(
          create: (_) => getIt<FriendsBloc>()..events.init(userId),
        ),
        BlocProvider(create: (_) => getIt<PostsBloc>()..events.init(userId)),
      ],
      child: const ProfileView(),
    );
  }
}

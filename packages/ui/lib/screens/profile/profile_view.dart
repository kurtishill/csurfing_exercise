import 'package:application/application.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/screens/profile/profile_screen.dart';
import 'package:ui/shared/extensions.dart';
import 'package:ui/src/setup.dart';

part 'components/__app_bar.dart';
part 'components/__friend.dart';
part 'components/__friends.dart';
part 'components/__post.dart';
part 'components/__posts.dart';
part 'components/__tab_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final user = state.asReady.user;

          return DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (_, _) => [
                _AppBar(user),
              ],
              body: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _Friends(),
                  _Posts(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

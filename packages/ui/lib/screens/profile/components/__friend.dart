part of '../profile_view.dart';

class _Friend extends StatelessWidget {
  _Friend(this.friend) : super(key: Key(friend.id));

  final Friend friend;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserBloc>()..events.init(friend.friendId),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const SizedBox(
              height: 60,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (!state.isReady) {
            return const SizedBox.shrink();
          }

          final user = state.asReady.user;

          return SizedBox(
            height: 60,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: CachedNetworkImageProvider(
                  user.image,
                ),
              ),
              title: Text(user.name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ProfileScreen(user.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

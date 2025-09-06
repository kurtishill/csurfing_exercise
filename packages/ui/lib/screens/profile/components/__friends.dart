part of '../profile_view.dart';

class _Friends extends StatelessWidget {
  const _Friends();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsBloc, FriendsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final friends = state.asReady.friends;

        if (friends.isEmpty) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!state.isReady) {
                return const SizedBox.shrink();
              }

              final user = state.asReady.user;

              return Center(
                child: Column(
                  children: [
                    Text(
                      '${user.name} has no friends 🥺',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FriendsBloc>().events.fetch();
                      },
                      child: const Text('Check again'),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: friends.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final friend = friends[index];
              return _Friend(friend);
            },
          ),
        );
      },
    );
  }
}

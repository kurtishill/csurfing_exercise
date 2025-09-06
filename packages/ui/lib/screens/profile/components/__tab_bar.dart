part of '../profile_view.dart';

class _TabBar extends StatelessWidget {
  const _TabBar();

  @override
  Widget build(BuildContext context) {
    final friendsState = context.watch<FriendsBloc>().state;
    final postsState = context.watch<PostsBloc>().state;

    final friends = <Friend>[];
    final posts = <Post>[];

    if (friendsState.isReady) {
      friends.addAll(friendsState.asReady.friends);
    }

    if (postsState.isReady) {
      posts.addAll(postsState.asReady.posts);
    }

    return TabBar(
      dividerHeight: 0,
      labelColor: context.theme.colorScheme.primary,
      unselectedLabelColor: context.theme.colorScheme.onSurface,
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(text: 'Friends (${friends.length})'),
        Tab(text: 'Posts (${posts.length})'),
      ],
    );
  }
}

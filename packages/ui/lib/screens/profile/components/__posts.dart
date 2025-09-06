part of '../profile_view.dart';

class _Posts extends StatelessWidget {
  const _Posts();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final posts = state.asReady.posts;

        if (posts.isEmpty) {
          return Center(
            child: Text(
              'No posts yet!',
              style: context.theme.textTheme.bodyLarge,
            ),
          );
        }

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: posts.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, _) => Divider(
              height: 0,
              thickness: 4,
              color: context.theme.colorScheme.inverseSurface,
            ),
            itemBuilder: (context, index) {
              final post = posts[index];
              return _Post(post);
            },
          ),
        );
      },
    );
  }
}

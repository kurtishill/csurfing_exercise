part of '../profile_view.dart';

class _Post extends StatelessWidget {
  const _Post(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;

    User? user;

    if (userState.isReady) {
      user = userState.asReady.user;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (user != null) ...[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                    user.image,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.createdAt.toDisplayDate(),
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text(post.message),
          if (post.image != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: CachedNetworkImage(
                  imageUrl: post.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

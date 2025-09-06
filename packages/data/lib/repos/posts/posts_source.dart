import 'dart:math';

import 'package:domain/domain.dart';

List<Post> fakePosts(String id) => [
  for (var i = 0; i < Random().nextInt(10) + 1; i++)
    Post.create(
      message: 'This is post $i from user $id',
      image: 'https://picsum.photos/500?${i}_$id',
    ),
];

class PostsSource implements IPostsSource {
  const PostsSource();

  @override
  Future<List<Post>> all(String userId) async {
    final posts = fakePosts(userId);

    return posts;
  }
}

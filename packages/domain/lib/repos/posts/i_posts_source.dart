import 'package:domain/models/post.dart';

abstract class IPostsSource {
  const IPostsSource();

  Future<List<Post>> all(String userId);
}

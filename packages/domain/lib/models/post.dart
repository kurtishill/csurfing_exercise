import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'post.g.dart';

@autoequal
class Post extends Equatable {
  const Post({
    required this.id,
    required this.createdAt,
    required this.message,
    this.image,
  });

  Post.create({
    required this.message,
    this.image,
  }) : id = 'NEW',
       createdAt = DateTime.now();

  final String id;
  final DateTime createdAt;
  final String message;
  final String? image;

  @override
  List<Object?> get props => _$props;
}

import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'friend.g.dart';

@autoequal
class Friend extends Equatable {
  const Friend({
    required this.id,
    required this.friendId,
    required this.friendSince,
  });

  Friend.create(this.friendId) : id = 'NEW', friendSince = DateTime.now();

  final String id;
  final String friendId;
  final DateTime friendSince;

  @override
  List<Object?> get props => _$props;
}

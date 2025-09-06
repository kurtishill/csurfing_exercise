import 'dart:math';

import 'package:domain/domain.dart';

List<Friend> fakeFriends(String id) => [
  for (var i = 1; i < Random().nextInt(10) + 2; i++)
    if ('$i' != id) Friend.create('$i'),
];

class FriendsSource implements IFriendsSource {
  const FriendsSource();

  @override
  Future<List<Friend>> all(String userId) async {
    final showFriends = Random().nextBool();

    if (!showFriends) {
      return [];
    }

    final friends = fakeFriends(userId);

    return friends;
  }
}

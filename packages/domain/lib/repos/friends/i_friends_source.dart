import 'package:domain/models/friend.dart';

abstract class IFriendsSource {
  const IFriendsSource();

  Future<List<Friend>> all(String userId);
}

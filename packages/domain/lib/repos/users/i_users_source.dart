import 'package:domain/models/user.dart';

abstract class IUsersSource {
  const IUsersSource();

  Future<User?> byId(String id);
}

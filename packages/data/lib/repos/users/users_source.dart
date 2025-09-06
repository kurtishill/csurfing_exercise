import 'package:domain/domain.dart';

class UsersSource implements IUsersSource {
  const UsersSource();

  @override
  Future<User?> byId(String id) async {
    if (id == '0') {
      return const User.create(
        firstName: 'Morgan',
        lastName: 'Hunt',
        about: 'Coding master 💪',
      );
    }

    return User.create(
      id: id,
      firstName: 'User',
      lastName: id,
      about: 'This is user $id',
    );
  }
}

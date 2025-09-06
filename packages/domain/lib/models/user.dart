import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@autoequal
class User extends Equatable {
  const User({
    required this.id,
    this.firstName = '',
    this.lastName = '',
    this.about = '',
  }) : image = 'https://picsum.photos/500?$id';

  const User.create({
    this.id = 'NEW',
    this.firstName = '',
    this.lastName = '',
    this.about = '',
  }) : image = 'https://picsum.photos/500?$id';

  final String id;
  final String firstName;
  final String lastName;
  final String about;
  final String image;

  String get name {
    if (firstName.isEmpty && lastName.isEmpty) {
      return 'No Name';
    }

    return '$firstName $lastName'.trim();
  }

  @override
  List<Object?> get props => _$props;
}

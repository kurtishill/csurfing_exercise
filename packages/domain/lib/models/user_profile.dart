import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'user_profile.g.dart';

@autoequal
class UserProfile extends Equatable {
  const UserProfile({
    this.firstName = '',
    this.lastName = '',
    this.about = '',
    this.image = 'https://picsum.photos/500?1',
  });

  final String firstName;
  final String lastName;
  final String about;
  final String image;

  @override
  List<Object?> get props => _$props;
}

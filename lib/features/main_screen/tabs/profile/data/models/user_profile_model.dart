import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.uid,
    required super.name,
    required super.email,
    super.photoUrl,
    super.phone,
  });

  factory UserProfileModel.fromFirebaseUser(User user) {
    return UserProfileModel(
      uid: user.uid,
      name: user.displayName ?? 'User',
      email: user.email ?? '',
      photoUrl: user.photoURL,
    );
  }
}

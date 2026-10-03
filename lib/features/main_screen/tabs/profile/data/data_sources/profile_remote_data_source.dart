import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileEntity> getCurrentUser();
  Future<void> signOut();
  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  });
  Future<void> deleteAccount();
}

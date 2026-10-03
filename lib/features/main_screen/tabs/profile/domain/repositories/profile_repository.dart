import '../entities/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getCurrentUser();
  Future<void> logoutUser();
  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  });
  Future<void> deleteAccount();
}
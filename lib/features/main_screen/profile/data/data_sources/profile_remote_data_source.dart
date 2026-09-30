import 'package:movies/features/main_screen/profile/domain/entities/user_profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileEntity> getCurrentUser();
  Future<void> signOut();
}

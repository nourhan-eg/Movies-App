import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserProfileEntity> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> logoutUser() {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  }) {
    return remoteDataSource.updateProfile(
      name: name,
      phone: phone,
      avatar: avatar,
    );
  }

  @override
  Future<void> deleteAccount() {
    return remoteDataSource.deleteAccount();
  }
}

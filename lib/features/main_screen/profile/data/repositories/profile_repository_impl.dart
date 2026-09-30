import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:movies/features/main_screen/profile/domain/entities/user_profile_entity.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/profile_repository.dart';

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
}

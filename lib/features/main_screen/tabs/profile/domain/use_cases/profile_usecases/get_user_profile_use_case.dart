import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/profile_repository.dart';

@injectable
class GetUserProfileUseCase {
  final ProfileRepository _repository;

  GetUserProfileUseCase(this._repository);

  Future<UserProfileEntity> call() async {
    return await _repository.getCurrentUser();
  }
}

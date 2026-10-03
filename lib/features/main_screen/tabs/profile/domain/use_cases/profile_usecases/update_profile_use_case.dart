import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/profile_repository.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<void> call({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    return await _repository.updateProfile(
      name: name,
      phone: phone,
      avatar: avatar,
    );
  }
}

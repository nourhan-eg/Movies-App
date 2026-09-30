import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/profile/domain/repositories/profile_repository.dart';

@injectable
class LogoutUseCase {
  final ProfileRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> call() async {
    return await _repository.logoutUser();
  }
}

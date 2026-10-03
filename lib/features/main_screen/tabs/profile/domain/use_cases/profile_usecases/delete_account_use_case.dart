import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/repositories/profile_repository.dart';

@injectable
class DeleteAccountUseCase {
  final ProfileRepository _repository;

  DeleteAccountUseCase(this._repository);

  Future<void> call() async {
    return await _repository.deleteAccount();
  }
}

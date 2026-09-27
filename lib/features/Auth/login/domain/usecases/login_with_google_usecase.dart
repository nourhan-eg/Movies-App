import 'package:dartz/dartz.dart';

import '../../../../../failure.dart';
import '../repositories/login_repository.dart';

class LoginWithGoogleUsecase {
  LoginRepository loginRepository;

  LoginWithGoogleUsecase({required this.loginRepository});

  Future<Either<Failure, void>> call() {
    return loginRepository.loginWithGoogle();
  }
}
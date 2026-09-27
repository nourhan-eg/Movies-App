import 'package:dartz/dartz.dart';
import 'package:movies/features/Auth/login/domain/repositories/login_repository.dart';

import '../../../../../failure.dart';

class LoginWithEmailUsecase {
  LoginRepository loginRepository;

  LoginWithEmailUsecase({required this.loginRepository});

  Future<Either<Failure, void>> call(String email, String password) async {
    return await loginRepository.loginWithEmail(
      email: email,
      password: password,
    );
  }
}

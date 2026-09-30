import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/login/domain/repositories/login_repository.dart';

import '../../../../../failure.dart';

@injectable
class LoginWithGoogleUsecase {
  LoginRepository loginRepository;

  LoginWithGoogleUsecase({required this.loginRepository});

  Future<Either<Failure, void>> call() async{
    return await loginRepository.loginWithGoogle();
  }
}
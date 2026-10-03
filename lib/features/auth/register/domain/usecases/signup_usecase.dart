import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/auth/register/domain/repositories/signup_repository.dart';

@injectable
class SignupUsecase {
  SignupRepository signupRepository;

  SignupUsecase({required this.signupRepository});

  Future<Either<Failure, void>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
    required String avatar,
  }) async {
    return await signupRepository.signUp(
      name: name,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
      avatar: avatar,
    );
  }
}

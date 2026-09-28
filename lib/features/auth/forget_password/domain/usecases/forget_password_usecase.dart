import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/auth/forget_password/domain/repositories/forget_password_repository.dart';

class ForgetPasswordUsecase {
  final ForgetPasswordRepository forgetPasswordRepository;

  ForgetPasswordUsecase({required this.forgetPasswordRepository});

  Future<Either<Failure, void>> call({required String email}) async {
    return await forgetPasswordRepository.sendPasswordResetEmail(email: email);
  }
}

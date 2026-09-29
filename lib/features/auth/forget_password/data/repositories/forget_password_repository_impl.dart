import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:movies/features/auth/forget_password/domain/repositories/forget_password_repository.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordRepositoryImpl({required this.forgetPasswordRemoteDataSource});

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email}) async {
    return await forgetPasswordRemoteDataSource.sendPasswordResetEmail(email: email);
  }
}

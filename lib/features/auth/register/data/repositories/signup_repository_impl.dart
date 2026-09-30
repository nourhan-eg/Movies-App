import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/auth/register/data/data_sources/signup_remote_data_source.dart';
import 'package:movies/features/auth/register/domain/repositories/signup_repository.dart';

@Injectable(as: SignupRepository)
class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource signupRemoteDataSource;

  SignupRepositoryImpl({required this.signupRemoteDataSource});

  @override
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  }) {
    return signupRemoteDataSource.signUp(
      name: name,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );
  }
}

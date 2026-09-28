import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';

abstract class SignupRepository {
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  });
}

import 'package:dartz/dartz.dart';

import '../../../../../failure.dart';

abstract class SignupRemoteDataSource {
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  });
}
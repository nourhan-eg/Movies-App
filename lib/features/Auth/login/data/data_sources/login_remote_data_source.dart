import 'package:dartz/dartz.dart';

import '../../../../../failure.dart';
abstract class LoginRemoteDataSource {
  Future<Either<Failure, void>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> loginWithGoogle();
}
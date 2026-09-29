import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}

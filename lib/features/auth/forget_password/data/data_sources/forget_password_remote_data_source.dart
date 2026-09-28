import 'package:dartz/dartz.dart';
import '../../../../../failure.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}

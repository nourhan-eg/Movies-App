import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/failure.dart';
import 'forget_password_remote_data_source.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl implements ForgetPasswordRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  ForgetPasswordRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to send password reset email'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

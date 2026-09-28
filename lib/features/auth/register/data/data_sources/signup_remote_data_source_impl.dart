import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/auth/register/data/data_sources/signup_remote_data_source.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  SignupRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  }) async {
    if (password != rePassword) {
      return Left(ServerFailure('Passwords do not match'));
    }
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Sign up failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

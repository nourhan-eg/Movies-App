import 'package:dartz/dartz.dart';
import 'package:movies/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:movies/features/auth/login/domain/repositories/login_repository.dart';

import '../../../../../failure.dart';

class LoginRepositoryImpl implements LoginRepository{
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, void>> loginWithEmail({required String email, required String password}) async {
    return await loginRemoteDataSource.loginWithEmail(email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> loginWithGoogle() async{
    return await loginRemoteDataSource.loginWithGoogle();
  }
  

}
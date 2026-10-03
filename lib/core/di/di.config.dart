// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes


import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart'
    as _i1048;
import '../../features/auth/forget_password/data/data_sources/forget_password_remote_data_source_impl.dart'
    as _i901;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i584;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i974;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i995;
import '../../features/auth/forget_password/presentation/bloc/forget_password_bloc.dart'
    as _i1028;
import '../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i117;
import '../../features/auth/login/data/data_sources/login_remote_data_source_impl.dart'
    as _i1030;
import '../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i470;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i176;
import '../../features/auth/login/domain/usecases/login_with_email_usecase.dart'
    as _i607;
import '../../features/auth/login/domain/usecases/login_with_google_usecase.dart'
    as _i25;
import '../../features/auth/login/presentation/bloc/login_bloc.dart' as _i885;
import '../../features/auth/register/data/data_sources/signup_remote_data_source.dart'
    as _i216;
import '../../features/auth/register/data/data_sources/signup_remote_data_source_impl.dart'
    as _i28;
import '../../features/auth/register/data/repositories/signup_repository_impl.dart'
    as _i929;
import '../../features/auth/register/domain/repositories/signup_repository.dart'
    as _i76;
import '../../features/auth/register/domain/usecases/signup_usecase.dart'
    as _i407;
import '../../features/auth/register/presentation/bloc/signup_bloc.dart'
    as _i305;
import '../../features/main_screen/browse/data/data_sources/browse_remote_data_source.dart'
    as _i473;
import '../../features/main_screen/browse/data/data_sources/browse_remote_data_source_impl.dart'
    as _i537;
import '../../features/main_screen/browse/data/repositories/browse_repository_impl.dart'
    as _i976;
import '../../features/main_screen/browse/domain/repositories/browse_repository.dart'
    as _i556;
import '../../features/main_screen/browse/domain/usecases/get_movies_by_genre_usecase.dart'
    as _i375;
import '../../features/main_screen/browse/presentation/bloc/browse_bloc.dart'
    as _i124;
import '../../features/main_screen/home/data/datasources/movie_remote_data_source.dart'
    as _i501;
import '../../features/main_screen/home/data/datasources/movie_remote_data_source_impl.dart'
    as _i84;
import '../../features/main_screen/home/data/repositories/movie_repository_impl.dart'
    as _i455;
import '../../features/main_screen/home/domain/repositories/movie_repository.dart'
    as _i663;
import '../../features/main_screen/home/domain/use_cases/get_movies_use_case.dart'
    as _i299;
import '../../features/main_screen/home/presentation/bloc/home_bloc.dart'
    as _i183;


extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);

    );
    gh.factory<_i501.MovieRemoteDataSource>(
      () => _i84.MovieRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );

      ),
    );
    gh.factory<_i663.MovieRepository>(
      () => _i455.MovieRepositoryImpl(gh<_i501.MovieRemoteDataSource>()),
    );

      ),
    );
    gh.factory<_i299.GetMoviesUseCase>(
      () => _i299.GetMoviesUseCase(gh<_i663.MovieRepository>()),
    );
    gh.factory<_i885.LoginBloc>(
      () => _i885.LoginBloc(
        loginWithEmailUsecase: gh<_i607.LoginWithEmailUsecase>(),
        loginWithGoogleUsecase: gh<_i25.LoginWithGoogleUsecase>(),
      ),
    );
    gh.factory<_i183.HomeBloc>(
      () => _i183.HomeBloc(gh<_i299.GetMoviesUseCase>()),
    );

    return this;
  }
}



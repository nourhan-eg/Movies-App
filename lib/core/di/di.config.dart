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
import '../../features/main_screen/search/data/data_sources/search_movies_data_source.dart'
    as _i577;
import '../../features/main_screen/search/data/data_sources/search_movies_data_source_impl.dart'
    as _i1070;
import '../../features/main_screen/search/data/repositories/search_repository_impl.dart'
    as _i48;
import '../../features/main_screen/search/domain/repositories/search_repository.dart'
    as _i383;
import '../../features/main_screen/search/domain/usecases/search_movies_usecase.dart'
    as _i956;
import '../../features/main_screen/search/presentation/bloc/search_bloc.dart'
    as _i1031;
import '../api/api_manager.dart' as _i1047;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i216.SignupRemoteDataSource>(
      () => _i28.SignupRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i117.LoginRemoteDataSource>(
      () => _i1030.LoginRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        googleSignIn: gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i1048.ForgetPasswordRemoteDataSource>(
      () => _i901.ForgetPasswordRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i473.BrowseRemoteDataSource>(
      () => _i537.BrowseRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i501.MovieRemoteDataSource>(
      () => _i84.MovieRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i974.ForgetPasswordRepository>(
      () => _i584.ForgetPasswordRepositoryImpl(
        forgetPasswordRemoteDataSource:
            gh<_i1048.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i663.MovieRepository>(
      () => _i455.MovieRepositoryImpl(gh<_i501.MovieRemoteDataSource>()),
    );
    gh.factory<_i577.SearchMoviesDataSource>(
      () => _i1070.SearchMoviesDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i76.SignupRepository>(
      () => _i929.SignupRepositoryImpl(
        signupRemoteDataSource: gh<_i216.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i407.SignupUsecase>(
      () => _i407.SignupUsecase(signupRepository: gh<_i76.SignupRepository>()),
    );
    gh.factory<_i556.BrowseRepository>(
      () => _i976.BrowseRepositoryImpl(gh<_i473.BrowseRemoteDataSource>()),
    );
    gh.factory<_i375.GetMoviesByGenreUsecase>(
      () => _i375.GetMoviesByGenreUsecase(gh<_i556.BrowseRepository>()),
    );
    gh.factory<_i995.ForgetPasswordUsecase>(
      () => _i995.ForgetPasswordUsecase(
        forgetPasswordRepository: gh<_i974.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i124.BrowseBloc>(
      () => _i124.BrowseBloc(
        getMoviesByGenreUsecase: gh<_i375.GetMoviesByGenreUsecase>(),
      ),
    );
    gh.factory<_i176.LoginRepository>(
      () => _i470.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i117.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i305.SignupBloc>(
      () => _i305.SignupBloc(signupUsecase: gh<_i407.SignupUsecase>()),
    );
    gh.factory<_i1028.ForgetPasswordBloc>(
      () => _i1028.ForgetPasswordBloc(
        forgetPasswordUsecase: gh<_i995.ForgetPasswordUsecase>(),
      ),
    );
    gh.factory<_i607.LoginWithEmailUsecase>(
      () => _i607.LoginWithEmailUsecase(
        loginRepository: gh<_i176.LoginRepository>(),
      ),
    );
    gh.factory<_i25.LoginWithGoogleUsecase>(
      () => _i25.LoginWithGoogleUsecase(
        loginRepository: gh<_i176.LoginRepository>(),
      ),
    );
    gh.factory<_i383.SearchRepository>(
      () => _i48.SearchRepositoryImpl(
        searchMoviesDataSource: gh<_i577.SearchMoviesDataSource>(),
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
    gh.factory<_i956.SearchMoviesUsecase>(
      () => _i956.SearchMoviesUsecase(
        searchRepository: gh<_i383.SearchRepository>(),
      ),
    );
    gh.factory<_i1031.SearchBloc>(
      () => _i1031.SearchBloc(gh<_i956.SearchMoviesUsecase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}

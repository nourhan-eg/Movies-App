// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i501.MovieRemoteDataSource>(
      () => _i84.MovieRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i663.MovieRepository>(
      () => _i455.MovieRepositoryImpl(gh<_i501.MovieRemoteDataSource>()),
    );
    gh.factory<_i299.GetMoviesUseCase>(
      () => _i299.GetMoviesUseCase(gh<_i663.MovieRepository>()),
    );
    gh.factory<_i183.HomeBloc>(
      () => _i183.HomeBloc(gh<_i299.GetMoviesUseCase>()),
    );
    return this;
  }
}

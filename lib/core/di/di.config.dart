// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
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
import '../../features/main_screen/profile/data/data_sources/history_local_data_source.dart'
    as _i922;
import '../../features/main_screen/profile/data/data_sources/history_local_data_source_impl.dart'
    as _i1005;
import '../../features/main_screen/profile/data/data_sources/profile_remote_data_source.dart'
    as _i363;
import '../../features/main_screen/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i840;
import '../../features/main_screen/profile/data/data_sources/wishlist_remote_data_source.dart'
    as _i214;
import '../../features/main_screen/profile/data/data_sources/wishlist_remote_data_source_impl.dart'
    as _i520;
import '../../features/main_screen/profile/data/repositories/history_repository_impl.dart'
    as _i572;
import '../../features/main_screen/profile/data/repositories/profile_repository_impl.dart'
    as _i712;
import '../../features/main_screen/profile/data/repositories/wishlist_repository_impl.dart'
    as _i402;
import '../../features/main_screen/profile/domain/repositories/history_repository.dart'
    as _i1008;
import '../../features/main_screen/profile/domain/repositories/profile_repository.dart'
    as _i192;
import '../../features/main_screen/profile/domain/repositories/wishlist_repository.dart'
    as _i134;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/add_to_history_use_case.dart'
    as _i541;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/clear_history_use_case.dart'
    as _i245;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/get_history_use_case.dart'
    as _i256;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/remove_from_history_use_case.dart'
    as _i923;
import '../../features/main_screen/profile/domain/use_cases/profile_usecases/get_user_profile_use_case.dart'
    as _i573;
import '../../features/main_screen/profile/domain/use_cases/profile_usecases/logout_use_case.dart'
    as _i284;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/add_to_wishlist_use_case.dart'
    as _i478;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/get_wishlist_use_case.dart'
    as _i961;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/remove_from_wishlist_use_case.dart'
    as _i31;
import '../api/api_manager.dart' as _i1047;
import 'firebase_module.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.singleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.factory<_i363.ProfileRemoteDataSource>(
      () => _i840.ProfileRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i192.ProfileRepository>(
      () => _i712.ProfileRepositoryImpl(
        remoteDataSource: gh<_i363.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i214.WishlistRemoteDataSource>(
      () => _i520.WishlistRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i922.HistoryLocalDataSource>(
      () => _i1005.HistoryLocalDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i1008.HistoryRepository>(
      () => _i572.HistoryRepositoryImpl(
        localDataSource: gh<_i922.HistoryLocalDataSource>(),
      ),
    );
    gh.factory<_i501.MovieRemoteDataSource>(
      () => _i84.MovieRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i134.WishlistRepository>(
      () => _i402.WishlistRepositoryImpl(
        remoteDataSource: gh<_i214.WishlistRemoteDataSource>(),
      ),
    );
    gh.factory<_i663.MovieRepository>(
      () => _i455.MovieRepositoryImpl(gh<_i501.MovieRemoteDataSource>()),
    );
    gh.factory<_i573.GetUserProfileUseCase>(
      () => _i573.GetUserProfileUseCase(gh<_i192.ProfileRepository>()),
    );
    gh.factory<_i284.LogoutUseCase>(
      () => _i284.LogoutUseCase(gh<_i192.ProfileRepository>()),
    );
    gh.factory<_i541.AddToHistoryUseCase>(
      () => _i541.AddToHistoryUseCase(gh<_i1008.HistoryRepository>()),
    );
    gh.factory<_i245.ClearHistoryUseCase>(
      () => _i245.ClearHistoryUseCase(gh<_i1008.HistoryRepository>()),
    );
    gh.factory<_i256.GetHistoryUseCase>(
      () => _i256.GetHistoryUseCase(gh<_i1008.HistoryRepository>()),
    );
    gh.factory<_i923.RemoveFromHistoryUseCase>(
      () => _i923.RemoveFromHistoryUseCase(gh<_i1008.HistoryRepository>()),
    );
    gh.factory<_i478.AddToWishlistUseCase>(
      () => _i478.AddToWishlistUseCase(gh<_i134.WishlistRepository>()),
    );
    gh.factory<_i961.GetWishlistUseCase>(
      () => _i961.GetWishlistUseCase(gh<_i134.WishlistRepository>()),
    );
    gh.factory<_i31.RemoveToWishlistUseCase>(
      () => _i31.RemoveToWishlistUseCase(gh<_i134.WishlistRepository>()),
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

class _$FirebaseModule extends _i616.FirebaseModule {}

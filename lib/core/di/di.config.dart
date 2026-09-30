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
    as _i601;
import '../../features/main_screen/profile/data/data_sources/history_local_data_source_impl.dart'
    as _i602;
import '../../features/main_screen/profile/data/data_sources/profile_remote_data_source.dart'
    as _i701;
import '../../features/main_screen/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i702;
import '../../features/main_screen/profile/data/data_sources/wishlist_remote_data_source.dart'
    as _i801;
import '../../features/main_screen/profile/data/data_sources/wishlist_remote_data_source_impl.dart'
    as _i802;
import '../../features/main_screen/profile/data/repositories/history_repository_impl.dart'
    as _i612;
import '../../features/main_screen/profile/data/repositories/profile_repository_impl.dart'
    as _i712;
import '../../features/main_screen/profile/data/repositories/wishlist_repository_impl.dart'
    as _i812;
import '../../features/main_screen/profile/domain/repositories/history_repository.dart'
    as _i611;
import '../../features/main_screen/profile/domain/repositories/profile_repository.dart'
    as _i711;
import '../../features/main_screen/profile/domain/repositories/wishlist_repository.dart'
    as _i811;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/add_to_history_use_case.dart'
    as _i621;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/clear_history_use_case.dart'
    as _i622;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/get_history_use_case.dart'
    as _i623;
import '../../features/main_screen/profile/domain/use_cases/history_usecases/remove_from_history_use_case.dart'
    as _i624;
import '../../features/main_screen/profile/domain/use_cases/profile_usecases/get_user_profile_use_case.dart'
    as _i721;
import '../../features/main_screen/profile/domain/use_cases/profile_usecases/logout_use_case.dart'
    as _i722;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/add_to_wishlist_use_case.dart'
    as _i821;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/get_wishlist_use_case.dart'
    as _i822;
import '../../features/main_screen/profile/domain/use_cases/wishlist_usecases/remove_to_wishlist_use_case.dart'
    as _i823;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);

    // ── Infrastructure ────────────────────────────────────────────────────────
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i59.FirebaseAuth>(() => _i59.FirebaseAuth.instance);
    gh.singleton<_i974.FirebaseFirestore>(() => _i974.FirebaseFirestore.instance);

    // ── Home ──────────────────────────────────────────────────────────────────
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

    // ── Profile — data sources ────────────────────────────────────────────────
    gh.factory<_i701.ProfileRemoteDataSource>(
      () => _i702.ProfileRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i801.WishlistRemoteDataSource>(
      () => _i802.WishlistRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i601.HistoryLocalDataSource>(
      () => _i602.HistoryLocalDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );

    // ── Profile — repositories ────────────────────────────────────────────────
    gh.factory<_i711.ProfileRepository>(
      () => _i712.ProfileRepositoryImpl(
        remoteDataSource: gh<_i701.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i811.WishlistRepository>(
      () => _i812.WishlistRepositoryImpl(
        remoteDataSource: gh<_i801.WishlistRemoteDataSource>(),
      ),
    );
    gh.factory<_i611.HistoryRepository>(
      () => _i612.HistoryRepositoryImpl(
        localDataSource: gh<_i601.HistoryLocalDataSource>(),
      ),
    );

    // ── Profile — use cases ───────────────────────────────────────────────────
    gh.factory<_i721.GetUserProfileUseCase>(
      () => _i721.GetUserProfileUseCase(gh<_i711.ProfileRepository>()),
    );
    gh.factory<_i722.LogoutUseCase>(
      () => _i722.LogoutUseCase(gh<_i711.ProfileRepository>()),
    );
    gh.factory<_i821.AddToWishlistUseCase>(
      () => _i821.AddToWishlistUseCase(gh<_i811.WishlistRepository>()),
    );
    gh.factory<_i822.GetWishlistUseCase>(
      () => _i822.GetWishlistUseCase(gh<_i811.WishlistRepository>()),
    );
    gh.factory<_i823.RemoveToWishlistUseCase>(
      () => _i823.RemoveToWishlistUseCase(gh<_i811.WishlistRepository>()),
    );
    gh.factory<_i621.AddToHistoryUseCase>(
      () => _i621.AddToHistoryUseCase(gh<_i611.HistoryRepository>()),
    );
    gh.factory<_i622.ClearHistoryUseCase>(
      () => _i622.ClearHistoryUseCase(gh<_i611.HistoryRepository>()),
    );
    gh.factory<_i623.GetHistoryUseCase>(
      () => _i623.GetHistoryUseCase(gh<_i611.HistoryRepository>()),
    );
    gh.factory<_i624.RemoveFromHistoryUseCase>(
      () => _i624.RemoveFromHistoryUseCase(gh<_i611.HistoryRepository>()),
    );

    return this;
  }
}

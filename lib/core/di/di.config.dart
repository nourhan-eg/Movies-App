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
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart'
    as _i1048;
import '../../features/auth/forget_password/data/data_sources/forget_password_remote_data_source_impl.dart'
    as _i901;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i584;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i975;
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
    as _i77;
import '../../features/auth/register/domain/usecases/signup_usecase.dart'
    as _i407;
import '../../features/auth/register/presentation/bloc/signup_bloc.dart'
    as _i305;
import '../../features/main_screen/tabs/browse/data/data_sources/browse_remote_data_source.dart'
    as _i418;
import '../../features/main_screen/tabs/browse/data/data_sources/browse_remote_data_source_impl.dart'
    as _i824;
import '../../features/main_screen/tabs/browse/data/repositories/browse_repository_impl.dart'
    as _i180;
import '../../features/main_screen/tabs/browse/domain/repositories/browse_repository.dart'
    as _i43;
import '../../features/main_screen/tabs/browse/domain/usecases/get_movies_by_genre_usecase.dart'
    as _i321;
import '../../features/main_screen/tabs/browse/presentation/bloc/browse_bloc.dart'
    as _i177;
import '../../features/main_screen/tabs/home/data/datasources/movie_remote_data_source.dart'
    as _i364;
import '../../features/main_screen/tabs/home/data/datasources/movie_remote_data_source_impl.dart'
    as _i546;
import '../../features/main_screen/tabs/home/data/repositories/movie_repository_impl.dart'
    as _i390;
import '../../features/main_screen/tabs/home/domain/repositories/movie_repository.dart'
    as _i779;
import '../../features/main_screen/tabs/home/domain/use_cases/get_movies_use_case.dart'
    as _i682;
import '../../features/main_screen/tabs/home/presentation/bloc/home_bloc.dart'
    as _i800;
import '../../features/main_screen/tabs/profile/data/data_sources/history_local_data_source.dart'
    as _i204;
import '../../features/main_screen/tabs/profile/data/data_sources/history_local_data_source_impl.dart'
    as _i478;
import '../../features/main_screen/tabs/profile/data/data_sources/profile_remote_data_source.dart'
    as _i292;
import '../../features/main_screen/tabs/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i351;
import '../../features/main_screen/tabs/profile/data/data_sources/wishlist_remote_data_source.dart'
    as _i764;
import '../../features/main_screen/tabs/profile/data/data_sources/wishlist_remote_data_source_impl.dart'
    as _i422;
import '../../features/main_screen/tabs/profile/data/repositories/history_repository_impl.dart'
    as _i342;
import '../../features/main_screen/tabs/profile/data/repositories/profile_repository_impl.dart'
    as _i756;
import '../../features/main_screen/tabs/profile/data/repositories/wishlist_repository_impl.dart'
    as _i780;
import '../../features/main_screen/tabs/profile/domain/repositories/history_repository.dart'
    as _i72;
import '../../features/main_screen/tabs/profile/domain/repositories/profile_repository.dart'
    as _i368;
import '../../features/main_screen/tabs/profile/domain/repositories/wishlist_repository.dart'
    as _i783;
import '../../features/main_screen/tabs/profile/domain/use_cases/history_usecases/add_to_history_use_case.dart'
    as _i604;
import '../../features/main_screen/tabs/profile/domain/use_cases/history_usecases/clear_history_use_case.dart'
    as _i222;
import '../../features/main_screen/tabs/profile/domain/use_cases/history_usecases/get_history_use_case.dart'
    as _i326;
import '../../features/main_screen/tabs/profile/domain/use_cases/history_usecases/remove_from_history_use_case.dart'
    as _i1016;
import '../../features/main_screen/tabs/profile/domain/use_cases/profile_usecases/delete_account_use_case.dart'
    as _i742;
import '../../features/main_screen/tabs/profile/domain/use_cases/profile_usecases/get_user_profile_use_case.dart'
    as _i778;
import '../../features/main_screen/tabs/profile/domain/use_cases/profile_usecases/logout_use_case.dart'
    as _i271;
import '../../features/main_screen/tabs/profile/domain/use_cases/profile_usecases/update_profile_use_case.dart'
    as _i752;
import '../../features/main_screen/tabs/profile/domain/use_cases/wishlist_usecases/add_to_wishlist_use_case.dart'
    as _i579;
import '../../features/main_screen/tabs/profile/domain/use_cases/wishlist_usecases/get_wishlist_use_case.dart'
    as _i845;
import '../../features/main_screen/tabs/profile/domain/use_cases/wishlist_usecases/remove_from_wishlist_use_case.dart'
    as _i1042;
import '../../features/main_screen/tabs/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart'
    as _i597;
import '../../features/main_screen/tabs/profile/presentation/bloc/history_bloc/history_bloc.dart'
    as _i344;
import '../../features/main_screen/tabs/profile/presentation/bloc/user_profile_bloc/profile_bloc.dart'
    as _i381;
import '../../features/main_screen/tabs/profile/presentation/bloc/wishlist_bloc/wishlist_bloc.dart'
    as _i248;
import '../../features/main_screen/tabs/search/data/data_sources/search_movies_data_source.dart'
    as _i21;
import '../../features/main_screen/tabs/search/data/data_sources/search_movies_data_source_impl.dart'
    as _i76;
import '../../features/main_screen/tabs/search/data/repositories/search_repository_impl.dart'
    as _i145;
import '../../features/main_screen/tabs/search/domain/repositories/search_repository.dart'
    as _i734;
import '../../features/main_screen/tabs/search/domain/usecases/search_movies_usecase.dart'
    as _i1066;
import '../../features/main_screen/tabs/search/presentation/bloc/search_bloc.dart'
    as _i747;
import '../../features/movie_details/data/data_sources/movie_details_remote_data_source.dart'
    as _i172;
import '../../features/movie_details/data/data_sources/movie_details_remote_data_source_impl.dart'
    as _i115;
import '../../features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i541;
import '../../features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i1010;
import '../../features/movie_details/domain/usecases/get_movie_details_usecase.dart'
    as _i124;
import '../../features/movie_details/domain/usecases/get_movie_suggestions_usecase.dart'
    as _i106;
import '../../features/movie_details/presentation/bloc/movie_details_bloc.dart'
    as _i1001;
import '../api/api_manager.dart' as _i1047;
import 'di.dart' as _i913;
import 'firebase_module.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final registerModule = _$RegisterModule();
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i292.ProfileRemoteDataSource>(
      () => _i351.ProfileRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i764.WishlistRemoteDataSource>(
      () => _i422.WishlistRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i216.SignupRemoteDataSource>(
      () => _i28.SignupRemoteDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i204.HistoryLocalDataSource>(
      () => _i478.HistoryLocalDataSourceImpl(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i368.ProfileRepository>(
      () => _i756.ProfileRepositoryImpl(
        remoteDataSource: gh<_i292.ProfileRemoteDataSource>(),
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
        firestore: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i172.MovieDetailsRemoteDataSource>(
      () => _i115.MovieDetailsRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i364.MovieRemoteDataSource>(
      () => _i546.MovieRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i21.SearchMoviesDataSource>(
      () => _i76.SearchMoviesDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i779.MovieRepository>(
      () => _i390.MovieRepositoryImpl(gh<_i364.MovieRemoteDataSource>()),
    );
    gh.factory<_i734.SearchRepository>(
      () => _i145.SearchRepositoryImpl(
        searchMoviesDataSource: gh<_i21.SearchMoviesDataSource>(),
      ),
    );
    gh.factory<_i1010.MovieDetailsRepository>(
      () => _i541.MovieDetailsRepositoryImpl(
        gh<_i172.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i975.ForgetPasswordRepository>(
      () => _i584.ForgetPasswordRepositoryImpl(
        forgetPasswordRemoteDataSource:
            gh<_i1048.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i418.BrowseRemoteDataSource>(
      () => _i824.BrowseRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i72.HistoryRepository>(
      () => _i342.HistoryRepositoryImpl(
        localDataSource: gh<_i204.HistoryLocalDataSource>(),
      ),
    );
    gh.factory<_i742.DeleteAccountUseCase>(
      () => _i742.DeleteAccountUseCase(gh<_i368.ProfileRepository>()),
    );
    gh.factory<_i778.GetUserProfileUseCase>(
      () => _i778.GetUserProfileUseCase(gh<_i368.ProfileRepository>()),
    );
    gh.factory<_i271.LogoutUseCase>(
      () => _i271.LogoutUseCase(gh<_i368.ProfileRepository>()),
    );
    gh.factory<_i752.UpdateProfileUseCase>(
      () => _i752.UpdateProfileUseCase(gh<_i368.ProfileRepository>()),
    );
    gh.factory<_i43.BrowseRepository>(
      () => _i180.BrowseRepositoryImpl(gh<_i418.BrowseRemoteDataSource>()),
    );
    gh.factory<_i77.SignupRepository>(
      () => _i929.SignupRepositoryImpl(
        signupRemoteDataSource: gh<_i216.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i407.SignupUsecase>(
      () => _i407.SignupUsecase(signupRepository: gh<_i77.SignupRepository>()),
    );
    gh.factory<_i783.WishlistRepository>(
      () => _i780.WishlistRepositoryImpl(
        remoteDataSource: gh<_i764.WishlistRemoteDataSource>(),
      ),
    );
    gh.factory<_i579.AddToWishlistUseCase>(
      () => _i579.AddToWishlistUseCase(gh<_i783.WishlistRepository>()),
    );
    gh.factory<_i845.GetWishlistUseCase>(
      () => _i845.GetWishlistUseCase(gh<_i783.WishlistRepository>()),
    );
    gh.factory<_i1042.RemoveFromWishlistUseCase>(
      () => _i1042.RemoveFromWishlistUseCase(gh<_i783.WishlistRepository>()),
    );
    gh.factory<_i124.GetMovieDetailsUseCase>(
      () => _i124.GetMovieDetailsUseCase(gh<_i1010.MovieDetailsRepository>()),
    );
    gh.factory<_i106.GetMovieSuggestionsUseCase>(
      () =>
          _i106.GetMovieSuggestionsUseCase(gh<_i1010.MovieDetailsRepository>()),
    );
    gh.factory<_i321.GetMoviesByGenreUsecase>(
      () => _i321.GetMoviesByGenreUsecase(gh<_i43.BrowseRepository>()),
    );
    gh.factory<_i995.ForgetPasswordUsecase>(
      () => _i995.ForgetPasswordUsecase(
        forgetPasswordRepository: gh<_i975.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i176.LoginRepository>(
      () => _i470.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i117.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i604.AddToHistoryUseCase>(
      () => _i604.AddToHistoryUseCase(gh<_i72.HistoryRepository>()),
    );
    gh.factory<_i222.ClearHistoryUseCase>(
      () => _i222.ClearHistoryUseCase(gh<_i72.HistoryRepository>()),
    );
    gh.factory<_i326.GetHistoryUseCase>(
      () => _i326.GetHistoryUseCase(gh<_i72.HistoryRepository>()),
    );
    gh.factory<_i1016.RemoveFromHistoryUseCase>(
      () => _i1016.RemoveFromHistoryUseCase(gh<_i72.HistoryRepository>()),
    );
    gh.factory<_i305.SignupBloc>(
      () => _i305.SignupBloc(signupUsecase: gh<_i407.SignupUsecase>()),
    );
    gh.factory<_i1028.ForgetPasswordBloc>(
      () => _i1028.ForgetPasswordBloc(
        forgetPasswordUsecase: gh<_i995.ForgetPasswordUsecase>(),
      ),
    );
    gh.factory<_i248.WishlistBloc>(
      () => _i248.WishlistBloc(
        getWishlistUseCase: gh<_i845.GetWishlistUseCase>(),
        addToWishlistUseCase: gh<_i579.AddToWishlistUseCase>(),
        removeFromWishlistUseCase: gh<_i1042.RemoveFromWishlistUseCase>(),
      ),
    );
    gh.factory<_i177.BrowseBloc>(
      () => _i177.BrowseBloc(
        getMoviesByGenreUsecase: gh<_i321.GetMoviesByGenreUsecase>(),
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
    gh.factory<_i1066.SearchMoviesUsecase>(
      () => _i1066.SearchMoviesUsecase(
        searchRepository: gh<_i734.SearchRepository>(),
      ),
    );
    gh.factory<_i597.EditProfileBloc>(
      () => _i597.EditProfileBloc(
        updateProfileUseCase: gh<_i752.UpdateProfileUseCase>(),
        deleteAccountUseCase: gh<_i742.DeleteAccountUseCase>(),
      ),
    );
    gh.factory<_i747.SearchBloc>(
      () => _i747.SearchBloc(gh<_i1066.SearchMoviesUsecase>()),
    );
    gh.factory<_i682.GetMoviesUseCase>(
      () => _i682.GetMoviesUseCase(gh<_i779.MovieRepository>()),
    );
    gh.factory<_i381.ProfileBloc>(
      () => _i381.ProfileBloc(
        getUserProfileUseCase: gh<_i778.GetUserProfileUseCase>(),
        logoutUseCase: gh<_i271.LogoutUseCase>(),
      ),
    );
    gh.factory<_i885.LoginBloc>(
      () => _i885.LoginBloc(
        loginWithEmailUsecase: gh<_i607.LoginWithEmailUsecase>(),
        loginWithGoogleUsecase: gh<_i25.LoginWithGoogleUsecase>(),
      ),
    );
    gh.factory<_i800.HomeBloc>(
      () => _i800.HomeBloc(gh<_i682.GetMoviesUseCase>()),
    );
    gh.factory<_i1001.MovieDetailsBloc>(
      () => _i1001.MovieDetailsBloc(
        getMovieDetailsUseCase: gh<_i124.GetMovieDetailsUseCase>(),
        getMovieSuggestionsUseCase: gh<_i106.GetMovieSuggestionsUseCase>(),
      ),
    );
    gh.factory<_i344.HistoryBloc>(
      () => _i344.HistoryBloc(
        getHistoryUseCase: gh<_i326.GetHistoryUseCase>(),
        addToHistoryUseCase: gh<_i604.AddToHistoryUseCase>(),
        removeFromHistoryUseCase: gh<_i1016.RemoveFromHistoryUseCase>(),
        clearHistoryUseCase: gh<_i222.ClearHistoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}

class _$RegisterModule extends _i913.RegisterModule {}

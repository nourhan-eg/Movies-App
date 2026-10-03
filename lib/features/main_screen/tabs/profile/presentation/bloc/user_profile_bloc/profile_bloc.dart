import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/use_cases/profile_usecases/logout_use_case.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/user_profile_bloc/profile_event.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/user_profile_bloc/profile_state.dart';

import '../../../domain/use_cases/profile_usecases/get_user_profile_use_case.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final LogoutUseCase logoutUseCase;

  ProfileBloc({ required this.getUserProfileUseCase, required this.logoutUseCase}) : super(ProfileInitial()){
    on<LoadProfile>(_loadProfile);
    on<LogoutRequest>(_logout);

  }

  Future<void> _loadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try{
      final user = await getUserProfileUseCase();
      emit(ProfileLoaded(user));
    }catch(e){
      emit(ProfileError('Failed to load profile'));
    }
  }
  Future<void> _logout(LogoutRequest event, Emitter<ProfileState> emit) async {
    try{
      await logoutUseCase();
      emit(ProfileLoggedOut());
    }catch(e){
      emit(ProfileError('Failed to logout'));
    }
    }
  }

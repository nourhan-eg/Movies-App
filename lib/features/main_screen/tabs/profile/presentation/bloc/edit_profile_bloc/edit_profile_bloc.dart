import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/use_cases/profile_usecases/delete_account_use_case.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/use_cases/profile_usecases/update_profile_use_case.dart';
import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  EditProfileBloc({
    required this.updateProfileUseCase,
    required this.deleteAccountUseCase,
  }) : super(EditProfileInitial()) {
    on<UpdateProfileRequested>(_updateProfile);
    on<DeleteAccountRequested>(_deleteAccount);
  }

  Future<void> _updateProfile(
    UpdateProfileRequested event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileLoading());
    try {
      await updateProfileUseCase(
        name: event.name,
        phone: event.phone,
        avatar: event.avatar,
      );
      emit(EditProfileUpdateSuccess());
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }

  Future<void> _deleteAccount(
    DeleteAccountRequested event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditProfileLoading());
    try {
      await deleteAccountUseCase();
      emit(EditProfileDeleteSuccess());
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }
}

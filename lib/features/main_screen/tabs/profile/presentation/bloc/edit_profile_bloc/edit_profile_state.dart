abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileUpdateSuccess extends EditProfileState {}

class EditProfileDeleteSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError(this.message);
}

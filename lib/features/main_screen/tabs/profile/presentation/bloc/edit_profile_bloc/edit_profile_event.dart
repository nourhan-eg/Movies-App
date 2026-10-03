abstract class EditProfileEvent {}

class UpdateProfileRequested extends EditProfileEvent {
  final String name;
  final String phone;
  final String avatar;

  UpdateProfileRequested({
    required this.name,
    required this.phone,
    required this.avatar,
  });
}

class DeleteAccountRequested extends EditProfileEvent {}

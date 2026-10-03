import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';

abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final UserProfileEntity user;
  ProfileLoaded(this.user);
}
class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
class ProfileLoggedOut extends ProfileState {}

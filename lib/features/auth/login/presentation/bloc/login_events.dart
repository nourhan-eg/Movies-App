abstract class LoginEvents {}

class LoginWithEmailRequested extends LoginEvents{
  final String email;
  final String password;

  LoginWithEmailRequested({required this.email, required this.password});
}

class LoginWithGoogleRequested extends LoginEvents{}
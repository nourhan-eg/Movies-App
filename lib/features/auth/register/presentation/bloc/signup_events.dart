abstract class SignupEvents {}

class SignupRequested extends SignupEvents {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String avatar;

  SignupRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.avatar,
  });
}

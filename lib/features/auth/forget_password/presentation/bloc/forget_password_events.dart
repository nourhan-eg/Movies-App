abstract class ForgetPasswordEvents {}

class ResetPasswordRequested extends ForgetPasswordEvents {
  final String email;

  ResetPasswordRequested({required this.email});
}

abstract class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoading extends ForgetPasswordStates {}

class ForgetPasswordSuccess extends ForgetPasswordStates {}

class ForgetPasswordFailure extends ForgetPasswordStates {
  final String message;

  ForgetPasswordFailure({required this.message});
}

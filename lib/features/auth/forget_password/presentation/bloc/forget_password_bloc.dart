import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'forget_password_events.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents, ForgetPasswordStates> {
  final ForgetPasswordUsecase forgetPasswordUsecase;

  ForgetPasswordBloc({required this.forgetPasswordUsecase}) : super(ForgetPasswordInitial()) {
    on<ResetPasswordRequested>((event, emit) async {
      final email = event.email.trim();
      if (email.isEmpty) {
        emit(ForgetPasswordFailure(message: 'Please enter your email address'));
        return;
      }

      final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)*\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(email)) {
        emit(ForgetPasswordFailure(message: 'Please enter a valid email address'));
        return;
      }
      emit(ForgetPasswordLoading());
      final result = await forgetPasswordUsecase(email: event.email.trim());
      result.fold(
        (failure) => emit(ForgetPasswordFailure(message: failure.message)),
        (_) => emit(ForgetPasswordSuccess()),
      );
    });
  }
}

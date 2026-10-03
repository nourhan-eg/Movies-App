import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/register/presentation/bloc/signup_events.dart';
import 'package:movies/features/auth/register/presentation/bloc/signup_states.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class SignupBloc extends Bloc<SignupEvents, SignupStates> {
  final SignupUsecase signupUsecase;

  SignupBloc({required this.signupUsecase}) : super(SignupInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(SignupLoading());
      final result = await signupUsecase(
        name: event.name,
        email: event.email,
        phone: event.phone,
        password: event.password,
        rePassword: event.rePassword,
        avatar: event.avatar,
      );
      result.fold(
        (failure) => emit(SignupFailure(message: failure.message)),
        (_) => emit(SignupSuccess()),
      );
    });
  }
}

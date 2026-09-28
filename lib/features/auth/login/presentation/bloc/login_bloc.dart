import 'package:bloc/bloc.dart';
import 'package:movies/features/auth/login/domain/usecases/login_with_email_usecase.dart';
import 'package:movies/features/auth/login/domain/usecases/login_with_google_usecase.dart';
import 'package:movies/features/auth/login/presentation/bloc/login_events.dart';
import 'package:movies/features/auth/login/presentation/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;

  LoginBloc({
    required this.loginWithEmailUsecase,
    required this.loginWithGoogleUsecase,
  }) : super(LoginInitial()) {
    on<LoginWithEmailRequested>((event, emit) async {
      emit(LoginLoading());
        final result = await loginWithEmailUsecase(
            email: event.email, password: event.password);

        result.fold((failure) => emit(LoginFailure(message: failure.message)),
            (_)=>emit(LoginSuccess()));
    });
    on<LoginWithGoogleRequested>((event, emit) async {
      emit(LoginLoading());
      final result = await loginWithGoogleUsecase();
      result.fold(
            (failure) => emit(LoginFailure(message: failure.message)),
            (_) => emit(LoginSuccess()),
      );
    });
  }
}

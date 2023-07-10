import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/features/auth/domain/usecases/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(email, password);
    result.fold(
        (l) => emit(LoginErrorState(l)), (r) => emit(LoginSuccessState()));
  }
}

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginEmailSentState extends LoginState {}

class LoginErrorState extends LoginState {
  final Failure failure;

  LoginErrorState(this.failure);
}

class LoginLoadingState extends LoginState {}

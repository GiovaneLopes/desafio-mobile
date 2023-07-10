import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<int> {
  AuthCubit() : super(0);
}

abstract class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

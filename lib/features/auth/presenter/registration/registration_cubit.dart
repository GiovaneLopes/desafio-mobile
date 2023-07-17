import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:app_dictionary/features/auth/domain/usecases/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationUsecase registrationUsecase;
  RegistrationCubit(this.registrationUsecase)
      : super(RegistrationInitialsState());

  Future<void> registration(UserEntity userEntity, String password) async {
    emit(RegistrationLoadingState());
    final result = await registrationUsecase(userEntity, password);
    result.fold((l) => emit(RegistrationErrorState(l)),
        (r) => emit(RegistrationSuccessState()));
  }
}

abstract class RegistrationState {}

class RegistrationInitialsState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  final Failure failure;

  RegistrationErrorState(this.failure);
}

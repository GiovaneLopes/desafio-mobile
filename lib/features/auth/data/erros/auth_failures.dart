import 'package:app_dictionary/core/errors/failure.dart';

class UserAlreadyInUse extends Failure {
  UserAlreadyInUse()
      : super(errorMessage: 'Usuário já cadastrado com este email.');
}

class WrongPassword extends Failure {
  WrongPassword() : super(errorMessage: 'Senha incorreta.');
}

class UserNotFound extends Failure {
  UserNotFound() : super(errorMessage: 'Usuário não encontrado.');
}

class InvalidEmail extends Failure {
  InvalidEmail() : super(errorMessage: 'Email inválido');
}

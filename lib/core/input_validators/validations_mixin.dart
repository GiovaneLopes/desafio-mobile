import 'package:email_validator/email_validator.dart';

mixin ValidationsMixin {
  String? isNotEmpty(String? value, {String? message}) {
    if (value == null || value.isEmpty) return message ?? 'Campo obrigatório';
    return null;
  }

  String? isEmailValid(String? value, {String? message}) {
    if (!EmailValidator.validate(value!)) return message ?? 'Email inválido';
    return null;
  }

  String? hasMinLength(String? value, int minLength, {String? message}) {
    if (value!.length < minLength) {
      return message ?? 'Deve ter pelo menos $minLength caracteres.';
    }
    return null;
  }

  String? equalPassword(String? value, String? secondValue, {String? message}) {
    if (value! != secondValue!) {
      return message ?? 'As senhas não estão iguais';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}

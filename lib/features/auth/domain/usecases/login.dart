import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCase {
  Future<Either<Failure, void>> call(String email, String password);
}

class LoginUseCaseImp implements LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCaseImp(this.authRepository);
  @override
  Future<Either<Failure, void>> call(String email, String password) async {
    return await authRepository.login(email, password);
  }
}

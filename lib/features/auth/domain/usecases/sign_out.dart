import 'package:app_dictionary/features/auth/domain/repositories/auth_repository.dart';

abstract class SignOutUsecase {
  Future<void> call();
}

class SignOutUsecaseImp implements SignOutUsecase {
  final AuthRepository authRepository;
  SignOutUsecaseImp(this.authRepository);
  @override
  Future<void> call() async {
    return await authRepository.signout();
  }
}

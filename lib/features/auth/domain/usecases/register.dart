import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:app_dictionary/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RegistrationUsecase {
  Future<Either<Failure, void>> call(UserEntity userEntity, String password);
}

class RegistrationUsecaseImp implements RegistrationUsecase {
  final AuthRepository authRepository;
  RegistrationUsecaseImp(this.authRepository);

  @override
  Future<Either<Failure, void>> call(
      UserEntity userEntity, String password) async {
    return await authRepository.registration(userEntity, password);
  }
}

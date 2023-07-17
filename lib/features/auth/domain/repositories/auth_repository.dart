import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);

  Future<Either<Failure, void>> registration(
      UserEntity userEntity, String password);

  Future<void> signout();
}

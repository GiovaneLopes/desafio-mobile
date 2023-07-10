import 'package:app_dictionary/core/errors/failure.dart';
import 'package:app_dictionary/core/platform/network_info.dart';
import 'package:app_dictionary/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_dictionary/features/auth/data/models/user_model.dart';
import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:app_dictionary/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final NetworkInfo networkInfo;

  AuthRepositoryImp(this.authRemoteDatasource, this.networkInfo);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.login(email, password);
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registration(
      UserEntity userEntity, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.registration(
            UserModel.fromEntity(userEntity), password);
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signout() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await authRemoteDatasource.signOut();
        return Right(result);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}

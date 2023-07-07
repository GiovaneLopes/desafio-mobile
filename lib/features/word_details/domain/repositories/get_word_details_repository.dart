import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordDetailsRepository {
  Future<Either<Exception, Word>> call(String word);
}

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  final WordsApiRemoteDatasource datasource;

  GetWordDetailsRepositoryImp(this.datasource);
  @override
  Future<Either<Exception, Word>> call(String word) async {
    try {
      final response = await datasource(word);
      return Right(response);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}

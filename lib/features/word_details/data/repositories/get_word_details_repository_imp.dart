import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  final WordsApiRemoteDatasource remoteDatasource;

  GetWordDetailsRepositoryImp(this.remoteDatasource);
  @override
  Future<Either<Exception, Word>> call(String word) async {
    try {
      final response = await remoteDatasource(word);
      return Right(response);
    } catch (e) {
      rethrow;
    }
  }
}

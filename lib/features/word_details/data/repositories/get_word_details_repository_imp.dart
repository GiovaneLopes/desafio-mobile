import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  final WordsApiRemoteDatasource datasource;

  GetWordDetailsRepositoryImp(this.datasource);
  @override
  Future<Either<Exception, Word>> call(String word) async {
    try {
      final response = await datasource(word);
      return Right(response);
    } catch (e) {
      rethrow;
    }
  }
}

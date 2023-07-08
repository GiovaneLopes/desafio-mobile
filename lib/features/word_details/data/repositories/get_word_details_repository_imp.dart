import 'package:app_dictionary/features/word_details/data/datasources/word_details_local_datasource.dart';
import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  final WordsApiRemoteDatasource remoteDatasource;
  final WordDetailsLocalDatasource localDatasource;

  GetWordDetailsRepositoryImp(this.remoteDatasource, this.localDatasource);
  @override
  Future<Either<Exception, Word>> call(String word) async {
    try {
      final localWord = await localDatasource.getCachedWord(word);
      if (localWord == null) {
        final response = await remoteDatasource(word);
        await localDatasource.cacheWord(WordModel.fromEntity(response));
        return Right(response);
      } else {
        return Right(localWord);
      }
    } catch (e) {
      rethrow;
    }
  }
}

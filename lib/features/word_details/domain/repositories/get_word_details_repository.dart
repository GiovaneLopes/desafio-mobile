import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordDetailsRepository {
  Future<Either<Exception, Word>> call(String word);
}

class GetWordDetailsRepositoryImp implements GetWordDetailsRepository {
  @override
  Future<Either<Exception, Word>> call(String word) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

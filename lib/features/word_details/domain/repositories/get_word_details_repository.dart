import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';

abstract class GetWordDetailsRepository {
  Future<Either<Exception, Word>> call(String word);
}

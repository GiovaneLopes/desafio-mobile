import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/data/repositories/get_word_details_repository_imp.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WordsApiRemoteDatasource>()])
import 'get_word_details_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockWordsApiRemoteDatasource();
  final repository = GetWordDetailsRepositoryImp(datasource);
  String wordText = 'door';
  final Word word =
      Word(word: wordText, definitions: [], pronunciation: '', frequency: 1.0);
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  });

  test('Should return a Word', () async {
    when(datasource(wordText)).thenAnswer((realInvocation) async => word);
    final result = await repository(wordText);
    expect(result.fold(id, id), isInstanceOf<Word>());
  });
}

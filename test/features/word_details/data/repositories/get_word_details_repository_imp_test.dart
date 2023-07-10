import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/data/repositories/get_word_details_repository_imp.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<WordsApiRemoteDatasource>(),
  MockSpec<LocalWordsDatasource>(),
])
import 'get_word_details_repository_imp_test.mocks.dart';

void main() {
  final remoteDatasource = MockWordsApiRemoteDatasource();
  final localDatasource = MockLocalWordsDatasource();
  final repository =
      GetWordDetailsRepositoryImp(remoteDatasource, localDatasource);
  String wordText = 'door';
  final Word word = Word(
      id: null,
      word: wordText,
      definitions: [],
      pronunciation: '',
      frequency: 1.0,
      isFavorited: false);
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  });

  test('Should return a Word', () async {
    when(remoteDatasource(wordText)).thenAnswer((realInvocation) async => word);
    final result = await repository.getWordDetails(wordText);
    expect(result.fold(id, id), isInstanceOf<Word>());
  });
}

import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/get_word_details_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockWordsApiRemoteDatasource();
  String wordText = 'door';
  final WordModel wordModel = WordModel(
      id: null,
      word: 'word',
      definitions: [],
      pronunciation: '',
      frequency: 1.0,
      isFavorited: false);
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
  });

  test('Should return a WordModel', () async {
    when(datasource(wordText)).thenAnswer((realInvocation) async => wordModel);
    final result = await datasource(wordText);
    expect(result, isInstanceOf<WordModel>());
  });
}

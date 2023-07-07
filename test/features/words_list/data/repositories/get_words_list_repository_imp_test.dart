import 'package:app_dictionary/features/words_list/data/datasources/words_remote_datasource.dart';
import 'package:app_dictionary/features/words_list/data/repositories/get_words_list_repository_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<WordsRemoteDatasource>()])
import 'get_words_list_repository_imp_test.mocks.dart';

void main() {
  final datasource = MockWordsRemoteDatasource();
  final repository = GetWordsListRepositoryImp(datasource);
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  test('Should return List of String', () async {
    when(datasource()).thenAnswer((_) async => <String>[]);

    final result = await repository();
    expect(result.fold(id, id), isInstanceOf<List<String>>());
  });
}

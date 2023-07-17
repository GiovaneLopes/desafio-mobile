import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/repositories/get_word_details_repository.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/get_word_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<GetWordDetailsRepository>()])
import 'get_word_details_test.mocks.dart';

void main() {
  final repository = MockGetWordDetailsRepository();
  final usecase = GetWordDetailsUsecaseImp(repository);
  final Word word = Word(
      id: null,
      word: "door",
      definitions: [],
      pronunciation: 'dour',
      frequency: 1.0,
      isFavorited: false);
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  test('Should return a Word', () async {
    when(repository.getWordDetails('door'))
        .thenAnswer((_) async => Right(word));

    final result = await usecase('door');
    expect(result.fold(id, id), isInstanceOf<Word>());
  });
}

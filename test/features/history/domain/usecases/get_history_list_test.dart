import 'package:app_dictionary/features/history/domain/repositories/history_repository.dart';
import 'package:app_dictionary/features/history/domain/usecases/get_history_list.dart';
import 'package:app_dictionary/features/word_details/data/models/word_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<HistoryRepository>()])
import 'get_history_list_test.mocks.dart';

void main() {
  final repository = MockHistoryRepository();
  final usecase = GetHistoryListUsecaseImp(repository);
  final List<WordModel> word = [
    WordModel(
        word: "door", definitions: [], pronunciation: 'dour', frequency: 1.0)
  ];

  test('Should return a List<WordModel>', () async {
    when(repository()).thenAnswer((_) async => Right(word));

    final result = await usecase();
    expect(result.fold(id, id), isInstanceOf<List<WordModel>>());
  });
}

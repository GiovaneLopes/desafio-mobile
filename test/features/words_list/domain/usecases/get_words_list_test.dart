import 'package:app_dictionary/features/words_list/domain/repositories/get_words_list_repository.dart';
import 'package:app_dictionary/features/words_list/domain/usecases/get_words_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<GetWordsListRepository>()])
import 'get_words_list_test.mocks.dart';

void main() {
  final repository = MockGetWordsListRepository();
  final usecase = GetWordsListUsecaseImp(repository);

  test('Should return List of Strings', () async {
    when(repository()).thenAnswer((_) async => const Right(<String>[]));
    final result = await usecase();
    expect(result.fold(id, id), isInstanceOf<List<String>>());
  });
}

import 'package:app_dictionary/features/auth/domain/usecases/sign_out.dart';
import 'package:app_dictionary/features/words_list/domain/usecases/get_words_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordsListCubit extends Cubit<WordsListState> {
  final GetWordsListUsecase getWordsListUsecase;
  final SignOutUsecase signOutUsecase;
  WordsListCubit(this.getWordsListUsecase, this.signOutUsecase)
      : super(WordsListLoadingState());

  List<String> cachedWords = [];

  void initialize() async {
    emit(WordsListLoadingState());
    final response = await getWordsListUsecase();
    response.fold((l) => emit(WordsListErrorState()), (wordsList) {
      cachedWords.addAll(wordsList);
      emit(WordsListSuccessState(cachedWords));
    });
  }

  void signOut() async {
    await signOutUsecase();
  }
}

abstract class WordsListState {}

class WordsListLoadingState extends WordsListState {}

class WordsListSuccessState extends WordsListState {
  final List<String> words;

  WordsListSuccessState(this.words);
}

class WordsListErrorState extends WordsListState {}

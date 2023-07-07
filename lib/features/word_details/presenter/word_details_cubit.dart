import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/get_word_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordDetailsCubit extends Cubit<WordDetailsState> {
  final GetWordDetailsUsecase usecase;
  WordDetailsCubit(this.usecase) : super(WordDetailsLoadingState());

  void initialize(String word) async {
    emit(WordDetailsLoadingState());
    final response = await usecase(word);
    response.fold((l) => emit(WordDetailsErrorState()),
        (word) => emit(WordDetailsSuccessState(word)));
  }
}

abstract class WordDetailsState {}

class WordDetailsLoadingState extends WordDetailsState {}

class WordDetailsErrorState extends WordDetailsState {}

class WordDetailsSuccessState extends WordDetailsState {
  final Word word;

  WordDetailsSuccessState(this.word);
}

import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/get_word_details.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/remove_favorite.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/set_favorite_word.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordDetailsCubit extends Cubit<WordDetailsState> {
  final GetWordDetailsUsecase getWordDetailsUsecase;
  final SetFavoriteWord setFavoriteWord;
  final RemoveFavoriteUsecase removeFavoriteUsecase;
  WordDetailsCubit(this.getWordDetailsUsecase, this.setFavoriteWord,
      this.removeFavoriteUsecase)
      : super(WordDetailsLoadingState());

  FlutterTts flutterTts = FlutterTts();

  Future<void> initialize(String word) async {
    emit(WordDetailsLoadingState());
    final response = await getWordDetailsUsecase(word);
    response.fold((l) => emit(WordDetailsErrorState()),
        (word) => emit(WordDetailsSuccessState(word)));
  }

  void setFavorite(Word word) async {
    await setFavoriteWord(word);
    await initialize(word.word);
  }

  void removeFavorite(Word word) async {
    await removeFavoriteUsecase(word);
    await initialize(word.word);
  }

  void playTextToSpeech(String text, double speed) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(speed);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }
}

abstract class WordDetailsState {}

class WordDetailsLoadingState extends WordDetailsState {}

class WordDetailsErrorState extends WordDetailsState {}

class WordDetailsSuccessState extends WordDetailsState {
  final Word word;

  WordDetailsSuccessState(this.word);
}

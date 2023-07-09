import 'package:app_dictionary/features/favorites/domain/usecases/get_favorites.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUsecase usecase;
  FavoritesCubit(this.usecase) : super(FavoritesLoadingState());

  void initialize() async {
    final response = await usecase();
    response.fold((l) => null, (r) => null);

    response.fold((l) => emit(FavoritesErrorState()),
        (favoritesList) => emit(FavoritesSuccessState(favoritesList)));
  }
}

abstract class FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesErrorState extends FavoritesState {}

class FavoritesSuccessState extends FavoritesState {
  final List<Word> favoritesList;

  FavoritesSuccessState(this.favoritesList);
}

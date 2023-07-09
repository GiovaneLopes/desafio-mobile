import 'package:app_dictionary/core/datasources/local_words_datasource/local_words_datasource.dart';
import 'package:app_dictionary/features/favorites/data/repositories/favorites_repository_imp.dart';
import 'package:app_dictionary/features/favorites/domain/usecases/get_favorites.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/remove_favorite.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/set_favorite_word.dart';
import 'package:app_dictionary/features/favorites/presenter/favorites_cubit.dart';
import 'package:app_dictionary/features/history/data/repository/history_repository_imp.dart';
import 'package:app_dictionary/features/history/domain/usecases/get_history_list.dart';
import 'package:app_dictionary/features/history/presenter/history_cubit.dart';
import 'package:app_dictionary/features/home/presenter/home_page.dart';
import 'package:app_dictionary/features/word_details/data/datasources/words_api_remote_datasource.dart';
import 'package:app_dictionary/features/word_details/data/repositories/get_word_details_repository_imp.dart';
import 'package:app_dictionary/features/word_details/domain/usecases/get_word_details.dart';
import 'package:app_dictionary/features/word_details/presenter/word_details_cubit.dart';
import 'package:app_dictionary/features/word_details/presenter/word_details_page.dart';
import 'package:app_dictionary/features/words_list/data/datasources/words_remote_datasource.dart';
import 'package:app_dictionary/features/words_list/data/repositories/get_words_list_repository_imp.dart';
import 'package:app_dictionary/features/words_list/domain/usecases/get_words_list.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Local Words
        Bind.lazySingleton((i) => LocalWordsDatasourceImp()),
        // Words List
        Bind.lazySingleton((i) => GetWordsListUsecaseImp(i())),
        Bind.lazySingleton((i) => GetWordsListRepositoryImp(i())),
        Bind.lazySingleton((i) => WordsRemoteDatasourceImp()),
        Bind.lazySingleton((i) => WordsListCubit(i())),
        //Word Details
        Bind.lazySingleton((i) => GetWordDetailsUsecaseImp(i())),
        Bind.lazySingleton((i) => GetWordDetailsRepositoryImp(i(), i())),
        Bind.lazySingleton((i) => WordsApiRemoteDatasourceImp()),
        Bind.lazySingleton((i) => WordDetailsCubit(i(), i(), i())),
        // History
        Bind.lazySingleton((i) => GetHistoryListUsecaseImp(i())),
        Bind.lazySingleton((i) => HistoryRepositoryImp(i())),
        Bind.lazySingleton((i) => HistoryCubit(i())),
        //Favorites
        Bind.lazySingleton((i) => GetFavoritesUsecaseImp(i())),
        Bind.lazySingleton((i) => SetFavoriteWordImp(i())),
        Bind.lazySingleton((i) => RemoveFavoriteUsecaseImp(i())),
        Bind.lazySingleton((i) => FavoritesRepositoryImp(i())),
        Bind.lazySingleton((i) => FavoritesCubit(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/word-details',
            child: (context, args) =>
                WordDetailsPage(args.data[0], args.data[1])),
      ];
}

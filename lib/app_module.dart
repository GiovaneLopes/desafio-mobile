import 'package:app_dictionary/features/words_list/data/datasources/words_remote_datasource.dart';
import 'package:app_dictionary/features/words_list/data/repositories/get_words_list_repository_imp.dart';
import 'package:app_dictionary/features/words_list/domain/usecases/get_words_list.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_cubit.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => GetWordsListUsecaseImp(i())),
        Bind.lazySingleton((i) => GetWordsListRepositoryImp(i())),
        Bind.lazySingleton((i) => WordsRemoteDatasourceImp()),
        Bind.lazySingleton((i) => WordsListCubit(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const WordsListPage()),
      ];
}

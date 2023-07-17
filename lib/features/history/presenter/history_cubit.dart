import 'package:app_dictionary/features/history/domain/usecases/get_history_list.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryListUsecase getHistoryListUsecase;
  HistoryCubit(this.getHistoryListUsecase) : super(HistoryLoadingState());

  void initialize() async {
    final response = await getHistoryListUsecase();

    response.fold((l) => emit(HistoryErrorState()),
        (historyList) => emit(HistorySuccessState(historyList)));
  }
}

abstract class HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryErrorState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final List<Word> historyList;

  HistorySuccessState(this.historyList);
}

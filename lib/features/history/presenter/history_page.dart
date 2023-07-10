import 'package:app_dictionary/core/ui/word_card.dart';
import 'package:app_dictionary/features/history/presenter/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryListPage extends StatefulWidget {
  const HistoryListPage({super.key});

  @override
  State<HistoryListPage> createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
  final HistoryCubit cubit = Modular.get();

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state.runtimeType == HistoryErrorState) {
              return Center(
                child: IconButton(
                    onPressed: () => cubit.initialize(),
                    icon: const Icon(Icons.update)),
              );
            }

            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    children: (state.runtimeType == HistorySuccessState)
                        ? (state as HistorySuccessState).historyList.isNotEmpty
                            ? List.generate(
                                state.historyList.length,
                                (index) => WordCard(
                                  (state).historyList[index].word,
                                  onPressed: () {
                                    Modular.to.pushNamed(
                                      '/word-details',
                                      arguments: [
                                        List.generate(
                                            state.historyList.length,
                                            (index) =>
                                                state.historyList[index].word),
                                        index
                                      ],
                                    ).then((value) => cubit.initialize());
                                  },
                                ),
                              )
                            : <Widget>[
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/no_data.svg',
                                      width: 120,
                                    ),
                                    const Text('Sem dados'),
                                  ],
                                )
                              ]
                        : <Widget>[],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

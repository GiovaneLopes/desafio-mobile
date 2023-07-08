import 'package:app_dictionary/core/ui/word_card.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WordsListPage extends StatefulWidget {
  const WordsListPage({super.key});

  @override
  State<WordsListPage> createState() => _WordsListPageState();
}

class _WordsListPageState extends State<WordsListPage> {
  final WordsListCubit cubit = Modular.get();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit.initialize();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      cubit.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state.runtimeType == WordsListErrorState) {
              return Center(
                child: IconButton(
                    onPressed: () => cubit.initialize(),
                    icon: const Icon(Icons.update)),
              );
            }

            return ListView(
              controller: scrollController,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Words list',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: (state.runtimeType == WordsListSuccessState)
                      ? List.generate(
                          (state as WordsListSuccessState).words.length,
                          (index) => WordCard(
                            (state).words[index],
                            onPressed: () {
                              Modular.to.pushNamed('/word-details',
                                  arguments: [index]);
                            },
                          ),
                        )
                      : <Widget>[],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:app_dictionary/core/utils/string_extension.dart';
import 'package:app_dictionary/features/word_details/presenter/widgets/word_detail_card.dart';
import 'package:app_dictionary/features/word_details/presenter/widgets/word_listen.dart';
import 'package:app_dictionary/features/word_details/presenter/widgets/word_meanings.dart';
import 'package:app_dictionary/features/word_details/presenter/word_details_cubit.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WordDetailsPage extends StatefulWidget {
  final List<String> words;
  final int index;
  const WordDetailsPage(this.words, this.index, {super.key});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  final WordDetailsCubit cubit = Modular.get();
  final WordsListCubit listCubit = Modular.get();
  int current = 0;

  @override
  void initState() {
    super.initState();
    current = widget.index;
    cubit.initialize(widget.words[current]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state.runtimeType == WordDetailsLoadingState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.teal[300],
                      ),
                    ],
                  ),
                );
              }
              if (state.runtimeType == WordDetailsErrorState) {
                return Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.words[current].capitalize(),
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                );
              }

              final success = state as WordDetailsSuccessState;
              return SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Modular.to.pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        const Text(
                          'Word Details',
                          style: TextStyle(fontSize: 22),
                        ),
                        IconButton(
                          onPressed: () => !success.word.isFavorited
                              ? cubit.setFavorite(success.word)
                              : cubit.removeFavorite(success.word),
                          icon: Icon(
                            success.word.isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: success.word.isFavorited
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 22, left: 22, right: 22, bottom: 50),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              WordDetailCard(word: success.word),
                              WordListen(word: widget.words[current]),
                              const SizedBox(
                                height: 22,
                              ),
                              if (success.word.definitions.isNotEmpty)
                                WordMeanings(word: success.word),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned.fill(
            bottom: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 22, vertical: 12),
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (current > 0) {
                            current = current - 1;
                            cubit.initialize(widget.words[current]);
                          } else {
                            current = widget.words.length - 1;
                          }
                        });
                      },
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (current < widget.words.length - 1) {
                            current = current + 1;
                            cubit.initialize(widget.words[current]);
                          } else {
                            current = 0;
                          }
                        });
                      },
                      child: const Text('Next'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

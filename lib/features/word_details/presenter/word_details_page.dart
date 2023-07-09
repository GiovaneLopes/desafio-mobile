import 'package:app_dictionary/core/utils/string_extension.dart';
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
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  border: Border.all(),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      success.word.word.capitalize(),
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                    if (success.word.pronunciation.isNotEmpty)
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 22,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Pronounce:',
                                                style: TextStyle(fontSize: 11),
                                              ),
                                              Text(
                                                success.word.pronunciation
                                                    .capitalize(),
                                                style: const TextStyle(
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              if (success.word.definitions.isNotEmpty)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Meanings',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        success.word.definitions.length,
                                        (index) => Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.teal[300],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      success.word
                                                          .definitions[index]
                                                          .capitalize(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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

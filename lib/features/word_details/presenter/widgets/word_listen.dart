import 'package:app_dictionary/features/word_details/presenter/word_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WordListen extends StatefulWidget {
  final String word;
  const WordListen({super.key, required this.word});

  @override
  State<WordListen> createState() => WordListenState();
}

class WordListenState extends State<WordListen> {
  final WordDetailsCubit cubit = Modular.get();
  int currentSpeed = 0;
  List<double> speedOptions = [.25, .5, 1];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Listen',
          style: TextStyle(fontSize: 22),
        ),
        const SizedBox(
          height: 22,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => cubit.playTextToSpeech(
                    widget.word, speedOptions[currentSpeed]),
                iconSize: 58,
                icon: Icon(
                  Icons.play_circle,
                  color: Colors.teal[300],
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentSpeed < speedOptions.length - 1) {
                      currentSpeed = currentSpeed + 1;
                    } else {
                      currentSpeed = 0;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    'x ${speedOptions[currentSpeed].toString()}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

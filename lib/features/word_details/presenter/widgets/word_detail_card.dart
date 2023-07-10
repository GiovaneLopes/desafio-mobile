import 'package:app_dictionary/core/utils/string_extension.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:flutter/material.dart';

class WordDetailCard extends StatelessWidget {
  final Word word;
  const WordDetailCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                word.word.capitalize(),
                style: const TextStyle(fontSize: 22),
              ),
              if (word.pronunciation.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Pronounce:',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          word.pronunciation.capitalize(),
                          style: const TextStyle(fontSize: 22),
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
      ],
    );
  }
}

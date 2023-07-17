import 'package:app_dictionary/core/utils/string_extension.dart';
import 'package:app_dictionary/features/word_details/domain/entities/word.dart';
import 'package:flutter/material.dart';

class WordMeanings extends StatelessWidget {
  final Word word;
  const WordMeanings({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            word.definitions.length,
            (index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal[300],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          word.definitions[index].capitalize(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 16),
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
    );
  }
}

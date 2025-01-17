import 'package:app_dictionary/core/utils/string_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String word;
  final Function() onPressed;
  const WordCard(this.word, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        padding: const EdgeInsets.all(8),
        height: 98,
        width: 98,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal[300],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: AutoSizeText(
                word.capitalize(),
                maxLines: 1,
                minFontSize: 8,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

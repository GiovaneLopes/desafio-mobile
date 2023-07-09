import 'package:app_dictionary/features/history/presenter/history_page.dart';
import 'package:app_dictionary/features/words_list/presenter/words_list_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> contents = [
    const WordsListPage(),
    const HistoryListPage(),
  ];
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentItem,
        onTap: (i) => setState(() => currentItem = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home_outlined,
            ),
            title: const Text("Words"),
            selectedColor: Colors.teal[300],
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: const Text("History"),
            selectedColor: Colors.teal[300],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            contents[currentItem],
          ],
        ),
      ),
    );
  }
}

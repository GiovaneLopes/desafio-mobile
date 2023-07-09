import 'package:app_dictionary/core/ui/word_card.dart';
import 'package:app_dictionary/features/favorites/presenter/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({super.key});

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  final FavoritesCubit cubit = Modular.get();

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
            if (state.runtimeType == FavoritesErrorState) {
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
                    'Favorites',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: (state.runtimeType == FavoritesSuccessState)
                      ? (state as FavoritesSuccessState)
                              .favoritesList
                              .isNotEmpty
                          ? List.generate(
                              state.favoritesList.length,
                              (index) => WordCard(
                                (state).favoritesList[index].word,
                                onPressed: () {
                                  Modular.to.pushNamed(
                                    '/word-details',
                                    arguments: [
                                      List.generate(
                                          state.favoritesList.length,
                                          (index) =>
                                              state.favoritesList[index].word),
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
              ],
            );
          },
        ),
      ),
    );
  }
}

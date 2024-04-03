import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/models/character_model.dart';
import 'package:rick_and_morty_flutter/widgets/images.dart';
import '../../../config/app_assets.dart';
import '../../../widgets/list_header_row.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeCharacterInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.onSurface,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: colorScheme.onSurface,
        title: const Image(
          image: AssetImage(AppAssets.RICK_AND_MORTY_TEXT),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //=============================================== Favorites ===============================================//
            ListHeaderRow(
              text: 'Favorites',
              onPressedViewAll: () {},
            ),

            //=============================================== Meet the cast ===============================================//
            ListHeaderRow(
              text: 'Meet the cast',
              onPressedViewAll: () {
                homeBloc.add(HomeViewAllCharacterActionEvent(context: context));
              },
            ),
            SizedBox(
              height: 160,
              child: BlocConsumer<HomeBloc, HomeState>(
                bloc: homeBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state) {
                    case HomeCharacterFetchingSuccess():
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          CharacterModel model =
                              state.characterModelList[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              children: [
                                PrimaryNetworkImage(
                                  imageUrl: model.image ?? '',
                                ),
                                const SizedBox(height: 10),
                                Text(model.name ?? ''),
                              ],
                            ),
                          );
                        },
                      );
                    case HomeCharacterFetchingLoading():
                      return const SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator());
                    case HomeCharacterFetchingError():
                    default:
                      return Container(
                        color: Colors.white,
                        height: 100,
                        width: 100,
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

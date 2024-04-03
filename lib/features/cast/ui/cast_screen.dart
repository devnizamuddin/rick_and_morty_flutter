import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/features/cast/bloc/cast_bloc.dart';
import 'package:rick_and_morty_flutter/models/character_detail_model.dart';

import '../../../config/app_assets.dart';
import '../../../widgets/images.dart';

class CastScreen extends StatefulWidget {
  static const route = '/castScreen';

  const CastScreen({super.key});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  final CastBloc castBloc = CastBloc();
  @override
  void initState() {
    castBloc.add(CastCharacterFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'All Cast',
              style: TextStyle(color: colorScheme.primary, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocConsumer<CastBloc, CastState>(
                bloc: castBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state) {
                    case CastCharacterFetchingSuccess():
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.characterDetailModelList.length,
                        itemBuilder: (context, position) {
                          CharacterDetailModel model =
                              state.characterDetailModelList[position];
                          return InkWell(
                            onTap: () {
                              castBloc.add(CastCharacterDetailPageNavigateEvent(
                                  context: context,
                                  characterDetailModel: model));
                            },
                            child: Container(
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
                            ),
                          );
                        },
                      );
                    case CastCharacterFetchingLoading():
                      return const SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator());
                    case CastCharacterFetchingError():
                    default:
                      return Container(
                        color: Colors.white,
                        height: 100,
                        width: 100,
                      );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

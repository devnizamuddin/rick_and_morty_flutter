import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/models/character_detail_model.dart';
import 'package:rick_and_morty_flutter/widgets/images.dart';

import '../../../config/app_assets.dart';

class CastDetailScreen extends StatelessWidget {
  static const route = '/castDetailScreen';

  const CastDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CharacterDetailModel model =
        ModalRoute.of(context)!.settings.arguments as CharacterDetailModel;
    final colorScheme = Theme.of(context).colorScheme;

    const TextStyle textStyle = TextStyle(color: Colors.white);

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
            Text(
              model.name ?? '',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            PrimaryNetworkImage(imageUrl: model.image ?? ''),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  model.status ?? '',
                  style: textStyle,
                ),
                Text(
                  model.species ?? '',
                  style: textStyle,
                ),
                Text(
                  model.gender ?? '',
                  style: textStyle,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              model.originModel?.name ?? '',
              style: textStyle,
            ),
            Text(
              model.locationModel?.name ?? '',
              style: textStyle,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: model.episodeModelList?.length,
                itemBuilder: (BuildContext context, int index) {
                  EpisodeModel? episodeModel = model.episodeModelList?[index];
                  return Text(
                    episodeModel?.name ?? '',
                    style: textStyle,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

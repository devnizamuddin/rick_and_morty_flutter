import 'package:flutter/material.dart';

import '../config/app_assets.dart';

class PrimaryNetworkImage extends StatelessWidget {
  const PrimaryNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = 120,
  });
  final String imageUrl;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      fit: BoxFit.cover,
      image: NetworkImage(
        imageUrl,
      ),
      errorBuilder: (context, error, stackTrace) {
        return Image(
          width: width,
          height: height,
          fit: BoxFit.cover,
          image: const AssetImage(AppAssets.DEFAULT_IMAGE),
        );
      },
    );
  }
}

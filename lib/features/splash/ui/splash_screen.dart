import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_assets.dart';
import '../splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    const splashFrameImage = AssetImage(AppAssets.SPLASH_FRAME);
    const rickAndMortyImage = AssetImage(AppAssets.RICK_AND_MORTY_CIRCLE);
    final SplashBloc splashBloc = SplashBloc();
    splashBloc.add(SetSplash());
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocListener<SplashBloc, SplashState>(
        bloc: splashBloc,
        listener: (context, state) {
          if (state is SplashLoaded) {
            debugPrint(
                '===================================================Moving to Landing Screen================================================');
          }
        },
        child: const SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image(image: splashFrameImage),
              ),
              Positioned(
                bottom: 40,
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 6,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Loading',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                child: Image(image: rickAndMortyImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cast/ui/cast_screen.dart';
import '../../episode/ui/episode_screen.dart';
import '../../home/ui/home_screen.dart';
import '../../locations/locations_screen.dart';
import '../../../widgets/main_nav_bar.dart';
import '../bloc/landing_page_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> bottomNavScreen = <Widget>[
      HomeScreen(),
      CastScreen(),
      EpisodeScreen(),
      LocationsScreen(),
    ];
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: bottomNavScreen.elementAt(state.tabIndex),
          bottomNavigationBar: MainNavBar(
            state: state,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/landing/bloc/landing_page_bloc.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    super.key,
    required this.state,
  });
  final LandingPageState state;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: state.tabIndex,
        onTap: (index) {
          BlocProvider.of<LandingPageBloc>(context)
              .add(TabChange(tabIndex: index));
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cast',
            icon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            label: 'Episode',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Locations',
            icon: Icon(Icons.explore),
          ),
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_theme.dart';
import 'config/routes.dart';
import 'features/landing/bloc/landing_page_bloc.dart';
import 'features/splash/bloc/splash_bloc.dart';

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => LandingPageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick And Morty',
        theme: AppTheme().themeData,
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}

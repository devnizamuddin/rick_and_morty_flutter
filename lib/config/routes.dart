import 'package:flutter/material.dart';

import '../features/cast/ui/cast_detail_screen.dart';
import '../features/landing/ui/landing_screen.dart';
import '../features/splash/ui/splash_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
    LandingScreen.route: (context) => const LandingScreen(),
    CastDetailScreen.route: (context) => const CastDetailScreen(),
  };
}

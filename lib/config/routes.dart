import 'package:flutter/material.dart';

import '../features/cast/ui/cast_detail_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    CastDetailScreen.route: (context) => const CastDetailScreen(),
  };
}

import 'package:corelab_app_challenge/features/home/presentation/pages/home_page.dart';
import 'package:corelab_app_challenge/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomePage(),
        search: (_) => const SearchPage(),
      };
}

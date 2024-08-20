import 'package:corelab_app_challenge/presentation/pages/home/home_page.dart';
import 'package:corelab_app_challenge/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomePage(),
        search: (_) => const SearchPage(),
      };
}

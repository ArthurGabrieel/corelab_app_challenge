import 'package:corelab_app_challenge/core/config/routes/navigator_keys.dart';
import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:corelab_app_challenge/features/categories/presentation/pages/categories_page.dart';
import 'package:corelab_app_challenge/features/home/presentation/pages/home_page.dart';
import 'package:corelab_app_challenge/features/search/presentation/pages/search_page.dart';
import 'package:corelab_app_challenge/shared/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String main = '/';
  static const String home = '/home';
  static const String search = '/search';

  static Map<String, WidgetBuilder> get routes => {
        main: (_) => const MainPage(),
      };

  static List<Widget> get bottomBarPages => [
        MaterialApp(
          navigatorKey: NavigatorKeys.homeNavigatorKey,
          theme: AppTheme.light,
          routes: {
            home: (_) => const HomePage(),
            search: (_) => const SearchPage(),
          },
          initialRoute: home,
        ),
        const CategoriesPage(),
        const HomePage(), // Placeholder for Anunciar Page
        const HomePage(), // Placeholder for Favoritos Page
        const HomePage(), // Placeholder for Conta Page
      ];
}

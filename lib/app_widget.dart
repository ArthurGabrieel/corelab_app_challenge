import 'package:corelab_app_challenge/core/config/routes/app_routes.dart';
import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routes: AppRoutes.routes,
    );
  }
}

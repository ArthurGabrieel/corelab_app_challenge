import 'package:corelab_app_challenge/core/config/routes/app_routes.dart';
import 'package:corelab_app_challenge/core/config/routes/navigator_keys.dart';
import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:corelab_app_challenge/core/service_locator.dart';
import 'package:corelab_app_challenge/features/home/presentation/bloc/home_bloc.dart';
import 'package:corelab_app_challenge/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<HomeBloc>()),
        BlocProvider(create: (_) => sl<SearchBloc>()),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorKeys.mainNavigatorKey,
        theme: AppTheme.light,
        routes: AppRoutes.routes,
      ),
    );
  }
}

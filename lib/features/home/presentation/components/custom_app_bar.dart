import 'package:corelab_app_challenge/core/config/routes/app_routes.dart';
import 'package:corelab_app_challenge/core/config/routes/navigator_keys.dart';
import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        color: AppTheme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                  NavigatorKeys.homeNavigatorKey.currentContext ?? context,
                  AppRoutes.search);
            },
            child: Ink(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 38,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buscar',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Icon(Icons.search, color: AppTheme.primaryColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

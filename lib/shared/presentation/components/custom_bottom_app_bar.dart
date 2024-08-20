import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 25.0,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 10),
      selectedLabelStyle:
          const TextStyle(color: AppTheme.primaryColor, fontSize: 10),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Anunciar'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
      ],
    );
  }
}

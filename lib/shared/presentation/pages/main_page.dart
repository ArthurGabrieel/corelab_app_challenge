import 'package:corelab_app_challenge/core/config/icons/app_icons.dart';
import 'package:corelab_app_challenge/core/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0 || index == 1) {
      setState(() => _selectedIndex = index);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Página em desenvolvimento'),
        ),
      );
    }
  }

  Widget _buildPageTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.90, end: 1.0).animate(animation),
        child: child,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: _buildPageTransition,
        child: AppRoutes.bottomBarPages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavItem(AppIcons.home, 'Home', 0),
          _buildNavItem(AppIcons.categories, 'Categorias', 1),
          _buildNavItem(AppIcons.announce, 'Anunciar', 2),
          _buildNavItem(AppIcons.favorite, 'Favoritos', 3),
          _buildNavItem(AppIcons.user, 'Conta', 4),
        ],
      ),
    );
  }
}

import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<String> categories = const [
    'Anestésicos e Agulhas Gengival',
    'Biossegurança',
    'Descartáveis',
    'Dentística e Estética',
    'Ortodontia',
    'Endodontia',
    'Periféricos e Peças de Mão',
    'Moldagem',
    'Prótese',
    'Cimentos',
    'Instrumentos',
    'Cirurgia e Periodontia',
    'Radiologia',
  ];

  Widget _buildListTile(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          title: Text(
            categories[index],
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: AppTheme.primaryColor,
                ),
          ),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          'Categorias',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => _buildListTile(context, index),
      ),
    );
  }
}

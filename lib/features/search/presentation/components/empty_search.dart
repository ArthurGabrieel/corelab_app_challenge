import 'package:flutter/material.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key, required this.search});

  final String search;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_results.png'),
          const SizedBox(height: 20),
          Text(
            'Resultado não encontrado',
            textAlign: TextAlign.center,
            style: textTheme.displayMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Não encontramos nenhum resultado parecido com "$search".',
            textAlign: TextAlign.center,
            style:
                textTheme.displaySmall?.copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

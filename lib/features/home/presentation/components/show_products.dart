import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:corelab_app_challenge/shared/presentation/components/product_card.dart';
import 'package:flutter/material.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
          child: Text(
            'Últimos anúncios',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Text(
            'Hoje',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}

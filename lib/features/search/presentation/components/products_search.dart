import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:corelab_app_challenge/shared/presentation/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductsSearch extends StatelessWidget {
  const ProductsSearch({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text('${products.length} resultados encontrados',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}

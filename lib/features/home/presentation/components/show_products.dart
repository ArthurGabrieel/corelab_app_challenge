import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:corelab_app_challenge/shared/presentation/components/product_card.dart';
import 'package:flutter/material.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    super.key,
    required this.productsCreatedToday,
    required this.productsCreatedYesterday,
  });

  final List<Product> productsCreatedToday;
  final List<Product> productsCreatedYesterday;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(
              title: 'Últimos anúncios',
              topPadding: 25.0,
              mediumTextStyle: true),
          if (productsCreatedToday.isNotEmpty) ...[
            const _SectionTitle(
              title: 'Hoje',
              topPadding: 15.0,
            ),
            _ProductList(products: productsCreatedToday),
          ],
          if (productsCreatedYesterday.isNotEmpty) ...[
            const _SectionTitle(title: 'Ontem'),
            _ProductList(products: productsCreatedYesterday),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final double topPadding;
  final bool mediumTextStyle;

  const _SectionTitle({
    required this.title,
    this.topPadding = 5.0,
    this.mediumTextStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: 5.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Text(
        title,
        style: mediumTextStyle
            ? Theme.of(context).textTheme.displayMedium
            : Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final List<Product> products;

  const _ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

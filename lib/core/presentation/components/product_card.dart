import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';
import 'package:corelab_app_challenge/core/domain/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.network(product.image),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _ProductDetails(product: product),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final Product product;
  const _ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.oldPrice != null) _DiscountTag(discount: product.discount),
        const SizedBox(height: 5),
        Text(
          product.name,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 5),
        if (product.oldPrice != null) _OldPriceText(price: product.oldPrice!),
        const SizedBox(height: 5),
        _CurrentPriceText(price: product.price),
        const SizedBox(height: 5),
        _InstallmentText(product: product),
        const SizedBox(height: 5),
        if (product.isNew)
          const Text(
            "NOVO",
            style: TextStyle(
              color: AppTheme.greyColor,
            ),
          ),
      ],
    );
  }
}

class _DiscountTag extends StatelessWidget {
  final int discount;

  const _DiscountTag({required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          "$discount% OFF",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _OldPriceText extends StatelessWidget {
  final double price;
  const _OldPriceText({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ ${price.toStringAsFixed(2)}',
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppTheme.greyColor,
          ),
    );
  }
}

class _CurrentPriceText extends StatelessWidget {
  final double price;
  const _CurrentPriceText({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ ${price.toStringAsFixed(2)}',
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class _InstallmentText extends StatelessWidget {
  final Product product;
  const _InstallmentText({required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
        "Em até ${product.installmentQuantity}x de R\$ ${product.installmentPrice.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 14,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w300,
            ));
  }
}

import 'package:corelab_app_challenge/core/domain/models/product.dart';
import 'package:corelab_app_challenge/core/presentation/components/custom_bottom_app_bar.dart';
import 'package:corelab_app_challenge/core/presentation/components/product_card.dart';
import 'package:corelab_app_challenge/presentation/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Product(
      name: 'Condicionador Ácido Fosfórico 37% - AllPrime',
      price: 100.0,
      oldPrice: 120.0,
      installmentQuantity: 12,
      installmentPrice: 10.0,
      image:
          'https://s3-alpha-sig.figma.com/img/3ded/87b5/07c8c009afd033ee12f5c860c659db64?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mBNAQ7Fywqdaxx5ZsR7zHmYFFiHGZB4lqkk1UqLdMs66dXFrnsXpRSaJIejrHaeQ3QlC1NdTq3gEg5Ma0cveB0Bw0GGKLy0lJLRFsC0R7pM9zvHk5gqZxr0YslENLb5KyCIqiM4IUVSXffxZ92FHyMeChyUjiRo4gKcTMjCpJVmfv~gCHnYj89ZcZuRohhrmmmfBiOFnyy6judbZCm1moeCXpjxRXwB1dU42GUiK2D1HAkIYcf8KB4LOiZIWOZjjZDClCHCnX1amMNmMje-M68H-7-Rpas8sN6FpHeDG7gMpkcQ9Y32JLP-qTqlEGFh49H-XKN3XZeA5LRT0CzEpZg__',
      discount: 10,
      createdAt: DateTime.now(),
    );

    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(),
      appBar: const CustomAppBar(),
      body: Column(
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
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

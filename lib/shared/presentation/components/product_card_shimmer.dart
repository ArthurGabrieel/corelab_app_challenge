import 'package:corelab_app_challenge/core/helpers/shimmer.dart';
import 'package:flutter/material.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key, required this.title});

  final String title;

  Widget _buildProductCardShimmer() {
    return Column(
      children: [
        const Divider(),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                ShimmerHelper.rectangular(width: 100, height: 100),
                const SizedBox(width: 20),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerHelper.rectangular(height: 20, width: 200),
                      const SizedBox(height: 6),
                      ShimmerHelper.rectangular(height: 20, width: 80),
                      const SizedBox(height: 6),
                      ShimmerHelper.rectangular(height: 20, width: 170),
                      const SizedBox(height: 6),
                      ShimmerHelper.rectangular(height: 20, width: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 25.0, bottom: 5.0, left: 10.0, right: 10.0),
          child: Text(title, style: Theme.of(context).textTheme.displayMedium),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, __) => _buildProductCardShimmer(),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}

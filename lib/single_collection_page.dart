import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/product_box.dart';
import 'package:union_shop/data/product_list.dart';

class SingleCollectionPage extends StatelessWidget {
  final String collectionTitle;

  const SingleCollectionPage({
    super.key,
    required this.collectionTitle,
  });

  List<Product> getProductsForCollection() {
    switch (collectionTitle) {
      case 'Hoodies':
        return hoodiesProducts;
      case 'Shirts':
        return shirtsProducts;
      // Add more cases for other collections
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = getProductsForCollection();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              collectionTitle,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductBox(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
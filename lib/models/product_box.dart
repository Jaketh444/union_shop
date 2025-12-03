import 'package:flutter/material.dart';
import 'product.dart';

class ProductBox extends StatelessWidget {
  final Product product;
  final bool isSale;

  const ProductBox({super.key, required this.product, this.isSale = false});

  @override
  Widget build(BuildContext context) {
    double displayPrice = product.price;
    if (isSale && product.categories.contains('Sale')) {
      displayPrice = product.price * 0.5; // 50% off
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: product.image.startsWith('assets/')
                ? Image.asset(product.image, fit: BoxFit.cover)
                : Image.network(product.image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              isSale && product.categories.contains('Sale')
                  ? '£${displayPrice.toStringAsFixed(2)} (50% off)'
                  : '£${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: isSale && product.categories.contains('Sale')
                    ? Colors.red
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

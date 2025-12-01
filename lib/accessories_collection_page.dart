import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class AccessoriesCollectionPage extends StatelessWidget {
  const AccessoriesCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy product data for Accessories collection
    final products = [
      {
        'name': 'Accessory Product 1',
        'image': 'https://via.placeholder.com/300',
        'price': '£10.00',
      },
      {
        'name': 'Accessory Product 2',
        'image': 'https://via.placeholder.com/300',
        'price': '£15.00',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Accessories',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: ListTile(
                            leading: Image.network(
                              product['image']!,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product['name']!),
                            subtitle: Text(product['price']!),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const UnionShopFooter(),
        ],
      ),
    );
  }
}
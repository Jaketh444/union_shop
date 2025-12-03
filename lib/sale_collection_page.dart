import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/pages/hoodie_page.dart';

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy sale products
    final products = [
      {
        'name': 'Portsmouth Hoodie (Sale)',
        'image': 'https://via.placeholder.com/300',
        'price': '£18.00',
        'oldPrice': '£25.00',
      },
      {
        'name': 'UPSU Tote Bag (Sale)',
        'image': 'https://via.placeholder.com/300',
        'price': '£4.00',
        'oldPrice': '£6.00',
      },
      {
        'name': 'Student Card Holder (Sale)',
        'image': 'https://via.placeholder.com/300',
        'price': '£2.50',
        'oldPrice': '£4.00',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context, selectedIndex: 2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sale Collection',
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
                            subtitle: Row(
                              children: [
                                Text(
                                  product['price']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  product['oldPrice']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              if (product['name'] == 'Portsmouth Hoodie (Sale)') {
                                Navigator.pushNamed(context, '/hoodie');
                              }
                              // TODO: Add navigation for other sale products
                            },
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
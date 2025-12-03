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
        'name': 'Portsmouth Keyring',
        'image': 'https://via.placeholder.com/300',
        'price': '£3.00',
      },
      {
        'name': 'University Tote Bag',
        'image': 'https://via.placeholder.com/300',
        'price': '£6.00',
      },
      {
        'name': 'UPSU Water Bottle',
        'image':
            'assets/water_bottle_1.png', // Use your actual asset image here
        'price': '£8.00',
      },
      {
        'name': 'Portsmouth Lanyard',
        'image': 'https://via.placeholder.com/300',
        'price': '£2.50',
      },
      {
        'name': 'Student Card Holder',
        'image': 'https://via.placeholder.com/300',
        'price': '£4.00',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context, selectedIndex: 4),
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
                        return InkWell(
                          onTap: product['name'] == 'UPSU Water Bottle'
                              ? () {
                                  Navigator.pushNamed(context, '/waterbottle');
                                }
                              : null,
                          child: Card(
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

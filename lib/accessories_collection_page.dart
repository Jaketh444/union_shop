import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/collection_box.dart';

class AccessoriesCollectionPage extends StatelessWidget {
  const AccessoriesCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy product data for Accessories collection
    final products = [
      {
        'title': 'Portsmouth Keyring',
        'image': 'https://via.placeholder.com/300',
        'route': '/keyring',
      },
      {
        'title': 'University Tote Bag',
        'image': 'https://via.placeholder.com/300',
        'route': '/totebag',
      },
      {
        'title': 'UPSU Water Bottle',
        'image': 'assets/water_bottle_1.png',
        'route': '/waterbottle',
      },
      {
        'title': 'Portsmouth Lanyard',
        'image': 'https://via.placeholder.com/300',
        'route': '/lanyard',
      },
      {
        'title': 'Student Card Holder',
        'image': 'https://via.placeholder.com/300',
        'route': '/cardholder',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: 4),
            Padding(
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 1.6,
                        ),
                        itemCount: products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return CollectionBox(
                            title: product['title'] ?? '',
                            image: product['image'] ?? '',
                            onTap: () {
                              if (product['route'] != null) {
                                Navigator.pushNamed(context, product['route']!);
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const UnionShopFooter(),
          ],
        ),
      ),
    );
  }
}

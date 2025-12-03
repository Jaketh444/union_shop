import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy sale products
    final products = [
      {
        'name': 'Portsmouth Hoodie (Sale)',
        'image': 'assets/hoodie_1.png',
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
                    child: LayoutBuilder(
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
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {
                                  if (product['name'] == 'Portsmouth Hoodie (Sale)') {
                                    Navigator.pushNamed(context, '/hoodie');
                                  }
                                  // TODO: Add navigation for other sale products
                                },
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: product['image']!.startsWith('assets/')
                                          ? Image.asset(
                                              product['image']!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              product['image']!,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: const EdgeInsets.all(12),
                                      color: Colors.black.withOpacity(0.45),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product['name']!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                product['price']!,
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                product['oldPrice']!,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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

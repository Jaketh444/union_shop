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
        'image': 'assets/water_bottle_1.png',
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
                                onTap: product['name'] == 'UPSU Water Bottle'
                                    ? () {
                                        Navigator.pushNamed(context, '/waterbottle');
                                      }
                                    : null,
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
                                          Text(
                                            product['price']!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
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

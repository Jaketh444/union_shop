import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy collection data
    // TODO: Replace image URLs with placeholder or owned assets before release
    final collections = [
      {
        'title': 'Hoodies & Sweatshirts',
        'image': 'https://shop.upsu.net/cdn/shop/collections/hoodies.jpg',
      },
      {
        'title': 'Gifts & Souvenirs',
        'image': 'https://shop.upsu.net/cdn/shop/collections/gifts.jpg',
      },
      {
        'title': 'Accessories',
        'image': 'https://shop.upsu.net/cdn/shop/collections/accessories.jpg',
      },
      {
        'title': 'Sale',
        'image': 'https://shop.upsu.net/cdn/shop/collections/sale.jpg',
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
                    'Collections',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Responsive grid for collections
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;
                      return const GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 1.6,
                        ),
                        itemCount: collections.length,
                        itemBuilder: (context, index) {
                          final collection = collections[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                // TODO: Navigate to dummy collection page
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      collection['image']!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Container(color: Colors.grey[300]),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.black.withOpacity(0.45),
                                    child: Text(
                                      collection['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
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

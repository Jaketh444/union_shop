// ignore_for_file: deprecated_member_use

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
          UnionShopNavBar(context, selectedIndex: 3),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 600 ? 1 : 2,
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
                        if (collection['title'] == 'Accessories') {
                          Navigator.pushNamed(context, '/accessories');
                        } else if (collection['title'] == 'Sale') {
                          Navigator.pushNamed(context, '/sale');
                        }
                        // TODO: Add navigation for other collections as needed
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              collection['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
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
              ),
            ),
          ),
          const UnionShopFooter(),
        ],
      ),
    );
  }
}

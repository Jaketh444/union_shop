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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Placeholder for grid to be added next
                  Text(
                    'Collection grid coming soon...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
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
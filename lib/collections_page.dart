// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/collection_box.dart';

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
        'route': '/hoodies',
      },
      {
        'title': 'Gifts & Souvenirs',
        'image': 'https://shop.upsu.net/cdn/shop/collections/gifts.jpg',
        'route': '/gifts',
      },
      {
        'title': 'Accessories',
        'image': 'https://shop.upsu.net/cdn/shop/collections/accessories.jpg',
        'route': '/accessories',
      },
      {
        'title': 'Sale',
        'image': 'https://shop.upsu.net/cdn/shop/collections/sale.jpg',
        'route': '/sale',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: 3),
            Padding(
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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  return CollectionBox(
                    title: collection['title']!,
                    image: collection['image']!,
                    onTap: () {
                      if (collection['route'] != null) {
                        Navigator.pushNamed(context, collection['route']!);
                      }
                    },
                  );
                },
              ),
            ),
            const UnionShopFooter(),
          ],
        ),
      ),
    );
  }
}

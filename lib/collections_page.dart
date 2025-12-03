// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/collection_box.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';

// Example list of collections
final List<Collection> collections = [
  Collection(
    title: 'Accessories',
    image: 'assets/accessories.png',
    route: '/accessories',
  ),
  Collection(
    title: 'Apparel',
    image: 'assets/apparel.png',
    route: '/apparel',
  ),
  Collection(
    title: 'Drinkware',
    image: 'assets/drinkware.png',
    route: '/drinkware',
  ),
  Collection(
    title: 'Bags',
    image: 'assets/bags.png',
    route: '/bags',
  ),
  Collection(
    title: 'Sale',
    image: 'assets/sale.png',
    route: '/sale',
  ),
  // Add more general collections as needed
];

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: 3),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: collections.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  return CollectionBox(
                    title: collection.title,
                    image: collection.image,
                    onTap: () {
                      Navigator.pushNamed(context, collection.route);
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

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  double width = constraints.maxWidth;
                  if (width < 600) {
                    crossAxisCount = 2;
                  } else if (width < 900) {
                    crossAxisCount = 3;
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: collections.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
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

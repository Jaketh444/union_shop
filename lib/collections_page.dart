// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/collection_box.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';

final List<Collection> allCollections = [
  Collection(
      title: 'Accessories',
      image: 'assets/accessories.png',
      route: '/accessories'),
  Collection(title: 'Apparel', image: 'assets/apparel.png', route: '/apparel'),
  Collection(
      title: 'Drinkware', image: 'assets/drinkware.png', route: '/drinkware'),
  Collection(title: 'Bags', image: 'assets/bags.png', route: '/bags'),
  Collection(title: 'Sale', image: 'assets/sale.png', route: '/sale'),
  // Add more general collections as needed
];

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String filter = 'All';
  String sort = 'A-Z';

  List<String> filterOptions = [
    'All',
    'Accessories',
    'Apparel',
    'Drinkware',
    'Bags',
    'Sale'
  ];
  List<String> sortOptions = ['A-Z', 'Z-A'];

  List<Collection> get filteredCollections {
    List<Collection> filtered = filter == 'All'
        ? allCollections
        : allCollections.where((c) => c.title == filter).toList();

    if (sort == 'A-Z') {
      filtered.sort((a, b) => a.title.compareTo(b.title));
    } else {
      filtered.sort((a, b) => b.title.compareTo(a.title));
    }
    return filtered;
  }

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
              child: Row(
                children: [
                  const Text('Filter: ', style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: filter,
                    items: filterOptions
                        .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => filter = value);
                    },
                  ),
                  const SizedBox(width: 24),
                  const Text('Sort: ', style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: sort,
                    items: sortOptions
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => sort = value);
                    },
                  ),
                ],
              ),
            ),
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
                    itemCount: filteredCollections.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final collection = filteredCollections[index];
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

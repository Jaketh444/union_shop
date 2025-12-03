// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/collection_box.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';

final List<Collection> allCollections = [
  Collection(
    title: 'Hoodies',
    image: 'assets/hoodies.png',
    route: '/hoodies',
    category: 'Apparel',
  ),
  Collection(
    title: 'Shirts',
    image: 'assets/shirts.png',
    route: '/shirts',
    category: 'Apparel',
  ),
  Collection(
    title: 'Jackets',
    image: 'assets/jackets.png',
    route: '/jackets',
    category: 'Apparel',
  ),
  Collection(
    title: 'Sweatpants',
    image: 'assets/sweatpants.png',
    route: '/sweatpants',
    category: 'Apparel',
  ),
  Collection(
    title: 'Caps',
    image: 'assets/caps.png',
    route: '/caps',
    category: 'Apparel',
  ),
  Collection(
    title: 'Socks',
    image: 'assets/socks.png',
    route: '/socks',
    category: 'Apparel',
  ),
  Collection(
    title: 'Scarves',
    image: 'assets/scarves.png',
    route: '/scarves',
    category: 'Apparel',
  ),
  Collection(
    title: 'Gloves',
    image: 'assets/gloves.png',
    route: '/gloves',
    category: 'Apparel',
  ),
  Collection(
    title: 'Accessories',
    image: 'assets/accessories.png',
    route: '/accessories',
    category: 'General',
  ),
  Collection(
    title: 'Drinkware',
    image: 'assets/drinkware.png',
    route: '/drinkware',
    category: 'General',
  ),
  Collection(
    title: 'Bags',
    image: 'assets/bags.png',
    route: '/bags',
    category: 'General',
  ),
  Collection(
    title: 'Sale',
    image: 'assets/sale.png',
    route: '/sale',
    category: 'Sale',
  ),
  // Add even more for demonstration
  Collection(
    title: 'Pins',
    image: 'assets/pins.png',
    route: '/pins',
    category: 'Accessories',
  ),
  Collection(
    title: 'Lanyards',
    image: 'assets/lanyards.png',
    route: '/lanyards',
    category: 'Accessories',
  ),
  Collection(
    title: 'Water Bottles',
    image: 'assets/water_bottles.png',
    route: '/waterbottles',
    category: 'Drinkware',
  ),
  Collection(
    title: 'Tote Bags',
    image: 'assets/tote_bags.png',
    route: '/totebags',
    category: 'Bags',
  ),
  Collection(
    title: 'Backpacks',
    image: 'assets/backpacks.png',
    route: '/backpacks',
    category: 'Bags',
  ),
  Collection(
    title: 'Mugs',
    image: 'assets/mugs.png',
    route: '/mugs',
    category: 'Drinkware',
  ),
  Collection(
    title: 'Notebooks',
    image: 'assets/notebooks.png',
    route: '/notebooks',
    category: 'Accessories',
  ),
  Collection(
    title: 'Gift Cards',
    image: 'assets/giftcards.png',
    route: '/giftcards',
    category: 'General',
  ),
];

// Update filterOptions to use categories
List<String> filterOptions = [
  'All',
  ...{for (var c in allCollections) c.category}
];

// Update filtering logic to use category
List<Collection> get filteredCollections {
  // ignore: prefer_typing_uninitialized_variables
  var filter;
  if (filter == 'All') return allCollections;
  return allCollections.where((c) => c.category == filter).toList();
}

int currentPage = 1;
const int itemsPerPage = 8; // Show 8 collections per page

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
    ...{for (var c in allCollections) c.category}
  ];
  List<String> sortOptions = ['A-Z', 'Z-A'];

  List<Collection> get filteredCollections {
    List<Collection> filtered = filter == 'All'
        ? allCollections
        : allCollections.where((c) => c.category == filter).toList();

    if (sort == 'A-Z') {
      filtered.sort((a, b) => a.title.compareTo(b.title));
    } else {
      filtered.sort((a, b) => b.title.compareTo(a.title));
    }
    return filtered;
  }

  List<Collection> get paginatedCollections {
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, filteredCollections.length);
    return filteredCollections.sublist(start, end);
  }

  int get totalPages => (filteredCollections.length / itemsPerPage).ceil();

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
                    itemCount: paginatedCollections.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final collection = paginatedCollections[index];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: currentPage > 1
                      ? () => setState(() => currentPage--)
                      : null,
                ),
                Text('Page $currentPage of $totalPages'),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: currentPage < totalPages
                      ? () => setState(() => currentPage++)
                      : null,
                ),
              ],
            ),
            const UnionShopFooter(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/product_box.dart';
import 'package:union_shop/data/product_list.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class SingleCollectionPage extends StatefulWidget {
  final String collectionTitle;

  const SingleCollectionPage({
    super.key,
    required this.collectionTitle,
  });

  @override
  State<SingleCollectionPage> createState() => _SingleCollectionPageState();
}

class _SingleCollectionPageState extends State<SingleCollectionPage> {
  String filter = 'All';
  String sort = 'A-Z';
  int currentPage = 1;
  final int itemsPerPage = 8;

  List<Product> getProductsForCollection() {
    switch (widget.collectionTitle) {
      case 'Hoodies':
        return hoodiesProducts;
      case 'Shirts':
        return shirtsProducts;
      // Add more cases for other collections
      default:
        return [];
    }
  }

  List<String> get filterOptions {
    final products = getProductsForCollection();
    return [
      'All',
      ...{for (var p in products) p.category}
    ];
  }

  List<Product> get filteredProducts {
    final products = getProductsForCollection();
    if (filter == 'All') return products;
    return products.where((p) => p.category == filter).toList();
  }

  List<Product> get sortedProducts {
    final list = [...filteredProducts];
    if (sort == 'A-Z') {
      list.sort((a, b) => a.title.compareTo(b.title));
    } else {
      list.sort((a, b) => b.title.compareTo(a.title));
    }
    return list;
  }

  List<Product> get paginatedProducts {
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, sortedProducts.length);
    return sortedProducts.sublist(start, end);
  }

  int get totalPages => (sortedProducts.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UnionShopHeader(),
            UnionShopNavBar(context, selectedIndex: 2),
            Text(
              widget.collectionTitle,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Filter: '),
                DropdownButton<String>(
                  value: filter,
                  items: filterOptions
                      .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        filter = value;
                        currentPage = 1;
                      });
                    }
                  },
                ),
                const SizedBox(width: 24),
                const Text('Sort: '),
                DropdownButton<String>(
                  value: sort,
                  items: ['A-Z', 'Z-A']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        sort = value;
                        currentPage = 1;
                      });
                    }
                  },
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paginatedProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final product = paginatedProducts[index];
                return ProductBox(product: product);
              },
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

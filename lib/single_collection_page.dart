import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart'; // You’ll need a Product model
import 'package:union_shop/models/product_box.dart'; // Reusable product widget

class SingleCollectionPage extends StatefulWidget {
  final String collectionTitle;
  final List<Product> products;

  const SingleCollectionPage({
    super.key,
    required this.collectionTitle,
    required this.products,
  });

  @override
  State<SingleCollectionPage> createState() => _SingleCollectionPageState();
}

class _SingleCollectionPageState extends State<SingleCollectionPage> {
  String filter = 'All';
  String sort = 'A-Z';
  int currentPage = 1;
  final int itemsPerPage = 8;

  List<String> get filterOptions => [
    'All',
    ...{for (var p in widget.products) p.category}
  ];

  List<Product> get filteredProducts {
    List<Product> filtered = filter == 'All'
        ? widget.products
        : widget.products.where((p) => p.category == filter).toList();

    if (sort == 'A-Z') {
      filtered.sort((a, b) => a.title.compareTo(b.title));
    } else {
      filtered.sort((a, b) => b.title.compareTo(a.title));
    }
    return filtered;
  }

  List<Product> get paginatedProducts {
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, filteredProducts.length);
    return filteredProducts.sublist(start, end);
  }

  int get totalPages => (filteredProducts.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.collectionTitle, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Row(
              children: [
                const Text('Filter: '),
                DropdownButton<String>(
                  value: filter,
                  items: filterOptions.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => filter = value);
                  },
                ),
                const SizedBox(width: 24),
                const Text('Sort: '),
                DropdownButton<String>(
                  value: sort,
                  items: ['A-Z', 'Z-A'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => sort = value);
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
          ],
        ),
      ),
    );
  }
}
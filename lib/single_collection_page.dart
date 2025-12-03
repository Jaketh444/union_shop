import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/product_box.dart';
import 'package:union_shop/data/product_list.dart';
import 'package:union_shop/widgets/union_shop_scaffold.dart';
import 'package:union_shop/widgets/collection_filter_bar.dart';
import 'package:union_shop/widgets/pagination_controls.dart';
import 'package:union_shop/single_product_page.dart';

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
    // Gather all product lists
    final allProducts = [
      ...hoodiesProducts,
      ...shirtsProducts,
      ...jacketsProducts,
      ...sweatpantsProducts,
      ...capsProducts,
      ...socksProducts,
      ...scarvesProducts,
      ...glovesProducts,
      ...accessoriesProducts,
      ...drinkwareProducts,
      ...bagsProducts,
      ...saleProducts,
      ...pinsProducts,
      ...lanyardsProducts,
      ...waterBottlesProducts,
      ...toteBagsProducts,
      ...backpacksProducts,
      ...mugsProducts,
      ...notebooksProducts,
      ...giftCardsProducts,
    ];
    if (widget.collectionTitle == 'Sale') {
      return allProducts.where((p) => p.categories.contains('Sale')).toList();
    }
    // Match products whose categories contain the collection title
    return allProducts
        .where((p) => p.categories.contains(widget.collectionTitle))
        .toList();
  }

  List<String> get filterOptions {
    final products = getProductsForCollection();
    return [
      'All',
      ...{for (var p in products) p.categories}.expand((c) => c)
    ];
  }

  List<Product> get filteredProducts {
    final products = getProductsForCollection();
    if (filter == 'All') return products;
    return products.where((p) => p.categories.contains(filter)).toList();
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
    final isSaleCollection = widget.collectionTitle == 'Sale';

    return UnionShopScaffold(
      navIndex: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.collectionTitle,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            CollectionFilterBar(
              filterOptions: filterOptions,
              selectedFilter: filter,
              onFilterChanged: (value) {
                setState(() {
                  filter = value;
                  currentPage = 1;
                });
              },
              sortOptions: const ['A-Z', 'Z-A'],
              selectedSort: sort,
              onSortChanged: (value) {
                setState(() {
                  sort = value;
                  currentPage = 1;
                });
              },
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleProductPage(product: product),
                      ),
                    );
                  },
                  child: ProductBox(
                    product: product,
                    isSale: isSaleCollection,
                  ),
                );
              },
            ),
            PaginationControls(
              currentPage: currentPage,
              totalPages: totalPages,
              onPrev:
                  currentPage > 1 ? () => setState(() => currentPage--) : null,
              onNext: currentPage < totalPages
                  ? () => setState(() => currentPage++)
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Collections'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context); // Returns to the collections page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/product_image_selector.dart';
import 'package:union_shop/models/product_customisation.dart';

class HoodieProductPage extends StatefulWidget {
  const HoodieProductPage({super.key});

  @override
  State<HoodieProductPage> createState() => _HoodieProductPageState();
}

class _HoodieProductPageState extends State<HoodieProductPage> {
  int selectedImage = 0;
  String selectedSize = 'S';
  String selectedColour = 'Black';
  int quantity = 1;

  final Map<String, dynamic> product = {
    'name': 'Portsmouth Hoodie (Sale)',
    'images': [
      'assets/hoodie_1.png',
      'assets/hoodie_2.png',
      'assets/hoodie_3.png',
    ],
    'price': '£18.00',
    'oldPrice': '£25.00',
    'description':
        'Classic Portsmouth hoodie, now on sale! Soft, comfortable, and perfect for campus life.',
    'sizes': ['S', 'M', 'L', 'XL'],
    'colours': ['Black', 'Grey', 'Navy'],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(product['images'] as List);

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context, selectedIndex: 2),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 600;
                      return isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ProductImageSelector(
                                    images: images,
                                    selectedImage: selectedImage,
                                    onImageSelected: (i) =>
                                        setState(() => selectedImage = i),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            product['price'] as String,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            product['oldPrice'] as String,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        product['description'] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      ProductCustomisation(
                                        sizes: product['sizes'] as List<String>,
                                        selectedSize: selectedSize,
                                        onSizeChanged: (value) => setState(() =>
                                            selectedSize =
                                                value ?? selectedSize),
                                        colours:
                                            product['colours'] as List<String>,
                                        selectedColour: selectedColour,
                                        onColourChanged: (value) => setState(
                                            () => selectedColour =
                                                value ?? selectedColour),
                                        quantity: quantity,
                                        onIncrease: () =>
                                            setState(() => quantity++),
                                        onDecrease: () {
                                          if (quantity > 1)
                                            setState(() => quantity--);
                                        },
                                        onAddToCart: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Added to cart!')),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Center(
                                  child: ProductImageSelector(
                                    images: images,
                                    selectedImage: selectedImage,
                                    onImageSelected: (i) =>
                                        setState(() => selectedImage = i),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product['price'] as String,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      product['oldPrice'] as String,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  product['description'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ProductCustomisation(
                                  sizes: product['sizes'] as List<String>,
                                  selectedSize: selectedSize,
                                  onSizeChanged: (value) => setState(() =>
                                      selectedSize = value ?? selectedSize),
                                  colours: product['colours'] as List<String>,
                                  selectedColour: selectedColour,
                                  onColourChanged: (value) => setState(() =>
                                      selectedColour = value ?? selectedColour),
                                  quantity: quantity,
                                  onIncrease: () => setState(() => quantity++),
                                  onDecrease: () {
                                    if (quantity > 1)
                                      setState(() => quantity--);
                                  },
                                  onAddToCart: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Added to cart!')),
                                    );
                                  },
                                ),
                              ],
                            );
                    },
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

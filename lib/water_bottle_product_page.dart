import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/product_image_selector.dart';
import 'package:union_shop/models/product_customisation.dart';

class WaterBottleProductPage extends StatefulWidget {
  const WaterBottleProductPage({super.key});

  @override
  State<WaterBottleProductPage> createState() => _WaterBottleProductPageState();
}

class _WaterBottleProductPageState extends State<WaterBottleProductPage> {
  int selectedImage = 0;
  String selectedSize = 'M';
  String selectedColour = 'Red';
  int quantity = 1;

  final Map<String, dynamic> product = {
    'name': 'UPSU Water Bottle',
    'images': [
      'assets/water_bottle_1.png',
      'assets/water_bottle_2.png',
      'assets/water_bottle_3.png',
    ],
    'price': '£8.00',
    'description':
        'Stay hydrated with this official UPSU water bottle. Durable, stylish, and perfect for campus life.',
    'sizes': ['S', 'M', 'L', 'XL'],
    'colours': ['Red', 'Blue', 'Green', 'Black'],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(product['images'] as List);

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(
            context,
            selectedIndex: 0,
          ),
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
                                // Images on the left
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
                                // Info and buttons on the right
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['price'] as String,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
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
                                        onSizeChanged: (value) =>
                                            setState(() => selectedSize = value!),
                                        colours: product['colours'] as List<String>,
                                        selectedColour: selectedColour,
                                        onColourChanged: (value) =>
                                            setState(() => selectedColour = value!),
                                        quantity: quantity,
                                        onIncrease: () => setState(() => quantity++),
                                        onDecrease: () {
                                          if (quantity > 1) setState(() => quantity--);
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
                                Text(
                                  product['price'] as String,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
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
                                  onSizeChanged: (value) =>
                                      setState(() => selectedSize = value!),
                                  colours: product['colours'] as List<String>,
                                  selectedColour: selectedColour,
                                  onColourChanged: (value) =>
                                      setState(() => selectedColour = value!),
                                  quantity: quantity,
                                  onIncrease: () => setState(() => quantity++),
                                  onDecrease: () {
                                    if (quantity > 1) setState(() => quantity--);
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

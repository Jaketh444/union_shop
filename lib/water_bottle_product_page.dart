import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class WaterBottleProductPage extends StatefulWidget {
  const WaterBottleProductPage({super.key});

  @override
  State<WaterBottleProductPage> createState() => _WaterBottleProductPageState();
}

class _WaterBottleProductPageState extends State<WaterBottleProductPage> {
  int selectedImage = 0;

  final Map<String, dynamic> product = {
    'name': 'UPSU Water Bottle',
    'images': [
      'https://via.placeholder.com/300?text=Main+Image',
      'https://via.placeholder.com/300?text=Side+View',
      'https://via.placeholder.com/300?text=Detail',
    ],
    'price': '£8.00',
    'description':
        'Stay hydrated with this official UPSU water bottle. Durable, stylish, and perfect for campus life.',
  };

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(product['images'] as List);

    return Scaffold(
      body: Column(
        children: [
          const UnionShopHeader(),
          UnionShopNavBar(context),
          Expanded(
            child: Padding(
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
                  Center(
                    child: Column(
                      children: [
                        Image.network(
                          images[selectedImage],
                          width: 220,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (i) {
                            return GestureDetector(
                              onTap: () => setState(() => selectedImage = i),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImage == i
                                        ? Color(0xFF4d2963)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Image.network(
                                  images[i],
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
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
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add to cart functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      child: const Text('Add to Cart'),
                    ),
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

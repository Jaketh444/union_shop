import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/models/product_image_selector.dart';

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
          UnionShopNavBar(context, selectedIndex: 0,),
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
                    child: ProductImageSelector(
                      images: images,
                      selectedImage: selectedImage,
                      onImageSelected: (i) => setState(() => selectedImage = i),
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

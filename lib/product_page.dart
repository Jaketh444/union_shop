import 'package:flutter/material.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/footer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final horizontalPadding = isMobile ? 12.0 : 24.0;
          final imageHeight = isMobile ? 180.0 : 300.0;
          final nameFontSize = isMobile ? 18.0 : 28.0;
          final priceFontSize = isMobile ? 16.0 : 24.0;
          final descTitleFontSize = isMobile ? 15.0 : 18.0;
          final descFontSize = isMobile ? 13.0 : 16.0;

          return Column(
            children: [
              const UnionShopHeader(),
              UnionShopNavBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isMobile ? 16 : 32),
                        // Product image
                        Container(
                          height: imageHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Image unavailable',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: isMobile ? 16 : 24),

                        // Product name
                        Text(
                          'Placeholder Product Name',
                          style: TextStyle(
                            fontSize: nameFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: isMobile ? 8 : 12),

                        // Product price
                        Text(
                          '£15.00',
                          style: TextStyle(
                            fontSize: priceFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4d2963),
                          ),
                        ),

                        SizedBox(height: isMobile ? 16 : 24),

                        // Product description
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: descTitleFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: isMobile ? 4 : 8),
                        Text(
                          'This is a placeholder description for the product. Students should replace this with real product information and implement proper data management.',
                          style: TextStyle(
                            fontSize: descFontSize,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: isMobile ? 24 : 32),
                      ],
                    ),
                  ),
                ),
              ),
              const UnionShopFooter(),
            ],
          );
        },
      ),
    );
  }
}
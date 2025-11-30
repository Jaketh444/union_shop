import 'package:flutter/material.dart';

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
          final headerHeight = isMobile ? 70.0 : 100.0;
          final horizontalPadding = isMobile ? 12.0 : 24.0;
          final verticalPadding = isMobile ? 12.0 : 24.0;
          final imageHeight = isMobile ? 180.0 : 300.0;
          final nameFontSize = isMobile ? 18.0 : 28.0;
          final priceFontSize = isMobile ? 16.0 : 24.0;
          final descTitleFontSize = isMobile ? 15.0 : 18.0;
          final descFontSize = isMobile ? 13.0 : 16.0;

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  height: headerHeight,
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Top banner
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: isMobile ? 4 : 8),
                        color: const Color(0xFF4d2963),
                        child: const Text(
                          'PLACEHOLDER HEADER TEXT',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // Main header
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 4 : 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  navigateToHome(context);
                                },
                                child: Image.network(
                                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                  height: isMobile ? 14 : 18,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      width: isMobile ? 14 : 18,
                                      height: isMobile ? 14 : 18,
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Spacer(),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 600),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.person_outline,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Product details
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),

                // Footer
                const UnionShopFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}

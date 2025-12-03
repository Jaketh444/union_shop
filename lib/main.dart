import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/models/nav_bar.dart';
import 'package:union_shop/models/header.dart';
import 'package:union_shop/models/footer.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/cart_page.dart'; // <-- Import the CartPage

Future<void> saveCart(List<CartItem> cartItems) async {
  final prefs = await SharedPreferences.getInstance();
  final cartJson = jsonEncode(cartItems.map((e) => e.toMap()).toList());
  await prefs.setString('cart', cartJson);
}

Future<List<CartItem>> loadCart() async {
  final prefs = await SharedPreferences.getInstance();
  final cartJson = prefs.getString('cart');
  if (cartJson == null) return [];
  final List decoded = jsonDecode(cartJson);
  return decoded.map((e) => CartItem.fromMap(e)).toList();
}

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/auth': (context) => const AuthPage(),
        '/cart': (context) => const CartPage(), // <-- Add this line
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey productsKey = GlobalKey();

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {}

  void scrollToProducts(BuildContext context) {
    final productsContext = productsKey.currentContext;
    if (productsContext != null) {
      Scrollable.ensureVisible(
        productsContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final heroHeight = isMobile ? 220.0 : 400.0;
          final horizontalPadding = isMobile ? 12.0 : 24.0;
          final sectionPadding = isMobile ? 20.0 : 40.0;
          final titleFontSize = isMobile ? 22.0 : 32.0;
          final subtitleFontSize = isMobile ? 15.0 : 20.0;
          final productTitleFontSize = isMobile ? 16.0 : 20.0;
          final gridCrossAxisCount = isMobile ? 1 : 2;

          return SingleChildScrollView(
            child: Column(
              children: [
                const UnionShopHeader(),
                UnionShopNavBar(context, selectedIndex: 0),
                // Hero Section
                SizedBox(
                  height: heroHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      // Content overlay
                      Positioned(
                        left: horizontalPadding,
                        right: horizontalPadding,
                        top: isMobile ? 32 : 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to the UPSU Shop',
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Shop official University of Portsmouth merchandise and gifts.",
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text(
                                'BROWSE PRODUCTS',
                                style:
                                    TextStyle(fontSize: 14, letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Products Section
                Container(
                  key: productsKey,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(sectionPadding),
                    child: Column(
                      children: [
                        Text(
                          'Featured Products',
                          style: TextStyle(
                            fontSize: productTitleFontSize,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: isMobile ? 24 : 48),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: gridCrossAxisCount,
                          crossAxisSpacing: isMobile ? 12 : 24,
                          mainAxisSpacing: isMobile ? 24 : 64,
                          childAspectRatio: isMobile ? 1.2 : 1.5,
                          children: const [
                            ProductCard(
                              title: 'Placeholder Product 1',
                              price: '£10.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            ),
                            ProductCard(
                              title: 'Placeholder Product 2',
                              price: '£15.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            ),
                            ProductCard(
                              title: 'Placeholder Product 3',
                              price: '£20.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            ),
                            ProductCard(
                              title: 'Placeholder Product 4',
                              price: '£25.00',
                              imageUrl:
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                            ),
                          ],
                        ),
                        SizedBox(height: isMobile ? 16 : 32),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 16 : 32,
                                vertical: isMobile ? 10 : 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'VIEW ALL PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),

                // Category navigation placeholder
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 24),
                  child: const Center(
                    child: Text(
                      'Shopping cart and checkout coming soon...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const UnionShopFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(_hovering ? 0.18 : 0.08),
                blurRadius: _hovering ? 12 : 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.price,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add this at the top level (outside any class)
List<CartItem> cartItems = [];

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/single_collection_page.dart';
import 'package:union_shop/single_product_page.dart';
import 'package:union_shop/models/product.dart';

void main() {
  testWidgets('AboutPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 800,
          height: 600,
          child: AboutPage(),
        ),
      ),
    );
    expect(find.byType(AboutPage), findsOneWidget);
  });

  testWidgets('AuthPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 800,
          height: 600,
          child: AuthPage(),
        ),
      ),
    );
    expect(find.byType(AuthPage), findsOneWidget);
  });

  testWidgets('CartPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 800,
          height: 600,
          child: CartPage(),
        ),
      ),
    );
    expect(find.byType(CartPage), findsOneWidget);
  });

  testWidgets('CollectionsPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 800,
          height: 600,
          child: CollectionsPage(),
        ),
      ),
    );
    expect(find.text('Collections'), findsOneWidget);
  });

  testWidgets('SingleCollectionPage renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 800,
          height: 600,
          child: SingleCollectionPage(
            collectionTitle: '',
          ),
        ),
      ),
    );
    expect(find.text('Collection'), findsOneWidget);
  });

  testWidgets('SingleProductPage renders', (WidgetTester tester) async {
    final product = Product(
      title: 'Test Product',
      image: 'assets/hoodie_1.png',
      description: 'A test product',
      categories: ['Test'],
      price: 19.99,
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleProductPage(product: product),
              );
            },
          ),
        ),
      ),
    );
    expect(find.byType(SingleProductPage), findsOneWidget);
    expect(find.text('Test Product'), findsOneWidget);
  });
}

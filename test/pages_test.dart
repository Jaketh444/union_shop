import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/single_collection_page.dart';
import 'package:union_shop/single_product_page.dart';
import 'package:union_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/widgets/pagination_controls.dart';

void main() {
  group('AboutPage', () {
    testWidgets('displays header, nav bar, and about text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AboutPage()));
      expect(find.text('About the UPSU Shop'), findsOneWidget);
      expect(find.textContaining('University of Portsmouth'), findsWidgets);
      expect(find.text('shop@upsu.net'), findsOneWidget);
      expect(find.text('Back to Homepage'), findsOneWidget);
    });
  });

  group('AuthPage', () {
    testWidgets('displays sign in form', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: AuthPage()));
      expect(find.text('Sign in to Union Shop'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Create account'), findsOneWidget);
    });
  });

  group('CartPage', () {
    testWidgets('displays cart title and empty message',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CartPage()));
      expect(find.text('Shopping Cart'), findsOneWidget);
      expect(find.text('Your cart is empty.'), findsOneWidget);
    });
  });

  group('CollectionsPage', () {
    testWidgets('displays filter bar and grid', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CollectionsPage()));
      expect(find.byType(CollectionsPage), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(PaginationControls), findsOneWidget);
    });
  });

  group('SingleCollectionPage', () {
    testWidgets('displays collection title and grid',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: SingleCollectionPage(collectionTitle: 'Test Collection'),
      ));
      expect(find.text('Test Collection'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(PaginationControls), findsOneWidget);
      expect(find.text('Back to Collections'), findsOneWidget);
    });
  });

  group('SingleProductPage', () {
    testWidgets('displays product details and Add to Cart button',
        (WidgetTester tester) async {
      final product = Product(
        title: 'Test Product',
        image: 'https://via.placeholder.com/150',
        description: 'A test product',
        categories: ['Test'],
        price: 19.99,
      );
      await tester.pumpWidget(MaterialApp(
        home: SingleProductPage(product: product),
      ));
      expect(find.text('Product Details'), findsOneWidget);
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('A test product'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.text('Back to Collection'), findsOneWidget);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/collection_box.dart';
import 'package:flutter/material.dart';

void main() {
  group('CartItem', () {
    final product = Product(
      title: 'Test Product',
      image: 'test.png',
      description: 'A test product',
      categories: ['Test'],
      price: 9.99,
    );

    test('constructor sets fields correctly', () {
      final item = CartItem(
        product: product,
        selectedSize: 'M',
        selectedColor: 'Red',
        quantity: 2,
      );
      expect(item.product.title, 'Test Product');
      expect(item.selectedSize, 'M');
      expect(item.selectedColor, 'Red');
      expect(item.quantity, 2);
    });

    test('toMap returns correct map', () {
      final item = CartItem(
        product: product,
        selectedSize: 'L',
        selectedColor: 'Blue',
        quantity: 1,
      );
      final map = item.toMap();
      expect(map['product']['title'], 'Test Product');
      expect(map['selectedSize'], 'L');
      expect(map['selectedColor'], 'Blue');
      expect(map['quantity'], 1);
    });

    test('fromMap creates correct CartItem', () {
      final map = {
        'product': product.toMap(),
        'selectedSize': 'S',
        'selectedColor': 'Green',
        'quantity': 3,
      };
      final item = CartItem.fromMap(map);
      expect(item.product.title, 'Test Product');
      expect(item.selectedSize, 'S');
      expect(item.selectedColor, 'Green');
      expect(item.quantity, 3);
    });
  });

  testWidgets('CollectionBox displays title and image, and responds to tap',
      (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(MaterialApp(
      home: CollectionBox(
        title: 'Test Collection',
        image: 'https://via.placeholder.com/150',
        onTap: () {
          tapped = true;
        },
      ),
    ));
    expect(find.text('Test Collection'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    await tester.tap(find.byType(CollectionBox));
    expect(tapped, isTrue);
  });
}

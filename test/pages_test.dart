import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/cart_page.dart';


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
}

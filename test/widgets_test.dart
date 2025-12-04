import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/collection_filter_bar.dart';
import 'package:union_shop/widgets/pagination_controls.dart';
import 'package:union_shop/widgets/union_shop_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  group('CollectionFilterBar', () {
    testWidgets('displays filter and sort controls',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CollectionFilterBar(
          filterOptions: ['All', 'Sale'],
          selectedFilter: 'All',
          onFilterChanged: (_) {},
          sortOptions: ['Price', 'Name'],
          selectedSort: 'Price',
          onSortChanged: (_) {},
        ),
      ));
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('Price'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
    });
  });

  group('PaginationControls', () {
    testWidgets('displays navigation buttons', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PaginationControls(
          currentPage: 1,
          totalPages: 3,
          onPrev: () {},
          onNext: () {},
        ),
      ));
      expect(find.text('Page 1 of 3'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });
  });

  group('UnionShopScaffold', () {
    testWidgets('displays header, nav bar, and footer',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: UnionShopScaffold(
          navIndex: 0,
          child: Text('Main Content'),
        ),
      ));
      expect(find.text('Free UK delivery on orders over £30!'), findsOneWidget);
      expect(find.text('Main Content'), findsOneWidget);
      expect(
          find.text('© 2025 Union Shop. All rights reserved.'), findsOneWidget);
    });
  });
}

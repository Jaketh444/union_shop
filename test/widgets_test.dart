import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/collection_filter_bar.dart';
import 'package:union_shop/widgets/pagination_controls.dart';
import 'package:flutter/material.dart';

void main() {
  group('CollectionFilterBar', () {
    testWidgets('renders filter and sort dropdowns',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CollectionFilterBar(
            filterOptions: ['All', 'Sale'],
            selectedFilter: 'All',
            onFilterChanged: (_) {},
            sortOptions: ['Price', 'Name'],
            selectedSort: 'Price',
            onSortChanged: (_) {},
          ),
        ),
      ));
      expect(find.byType(DropdownButton<String>), findsNWidgets(2));
      expect(find.text('Filter: '), findsOneWidget);
      expect(find.text('Sort: '), findsOneWidget);
    });
  });

  group('PaginationControls', () {
    testWidgets('renders page info and navigation buttons',
        (WidgetTester tester) async {
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

}

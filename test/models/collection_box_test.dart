import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection_box.dart';
import 'package:flutter/material.dart';

void main() {
	testWidgets('CollectionBox displays title and image, and responds to tap', (WidgetTester tester) async {
		bool tapped = false;
		await tester.pumpWidget(MaterialApp(
			home: CollectionBox(
				title: 'Test Collection',
				image: 'https://via.placeholder.com/150',
				onTap: () { tapped = true; },
			),
		));
		expect(find.text('Test Collection'), findsOneWidget);
		expect(find.byType(Image), findsOneWidget);
		await tester.tap(find.byType(CollectionBox));
		expect(tapped, isTrue);
	});
}

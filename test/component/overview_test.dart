import "package:flutter/material.dart";
import "package:flutter_demo/main.dart";
import "package:flutter_demo/views/routes/overview.dart";
import "package:flutter_test/flutter_test.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

Widget appFrom(Widget wut) {
  return ProviderScope(child: MaterialApp(home: wut));
}

void main() {
  testWidgets("Overview correctly displays first element", (tester) async {
    await tester.pumpWidget(appFrom(const OverviewPage()));
    await tester.pumpAndSettle();

    expect(find.text("hey"), findsOneWidget);
    expect(find.textContaining(DateTime.now().year.toString()), findsOneWidget);
  });

  group("Full app testing", () {
    testWidgets("Create a new Todo", (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text("hey"), findsOneWidget);

      final fab = find.byKey(const Key("new"));

      expect(fab, findsOneWidget);

      await tester.tap(fab);
      await tester.pumpAndSettle();
    });
  });
}

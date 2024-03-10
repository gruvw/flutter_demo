import "package:flutter/material.dart";
import "package:flutter_demo/main.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Integration testing", () {
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

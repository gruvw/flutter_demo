import "package:flutter/material.dart";
import "package:flutter_demo/views/navigation/routes.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "Flutter Demo",
        onGenerateRoute: generateRoute,
        initialRoute: Routes.overview.name,
      ),
    );
  }
}

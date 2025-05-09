import 'package:flutter/material.dart';
import 'package:konkan_bite_food/core/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginRoute, // Use the initial route from the Routes class
      onGenerateRoute: Routes.generateRoute, // Use the route generator function
    );
  }
}

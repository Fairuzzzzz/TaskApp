import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/pages/mainscreen.dart';
import 'package:taskapp/provider/recipe_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => RecipeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

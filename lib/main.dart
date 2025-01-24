import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/notifier/recipe_notifier.dart';
import 'package:taskapp/pages/mainscreen.dart';
import 'package:taskapp/notifier/favorite_notifier.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteNotifier()),
    ChangeNotifierProvider(create: (_) => RecipeNotifier()),
  ], child: const MyApp()));
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

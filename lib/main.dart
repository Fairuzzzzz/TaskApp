import 'package:flutter/material.dart';
import 'package:taskapp/pages/mainscreen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(const MyApp());
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

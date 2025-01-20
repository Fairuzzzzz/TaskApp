import 'package:flutter/foundation.dart';
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
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

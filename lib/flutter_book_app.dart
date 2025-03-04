import 'package:flutter/material.dart';
import 'package:flutter_book/router/router.dart';

class FlutterBookApp extends StatelessWidget {
  const FlutterBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'FlutterBook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    );
  }
}

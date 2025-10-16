import 'package:flutter/material.dart';
import 'package:periodico_app/news/sports_news.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const Center(child: SportNews())),
    );
  }
}

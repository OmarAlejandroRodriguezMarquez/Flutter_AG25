import 'package:flutter/material.dart';
import 'package:periodico_app/layout/navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Noticias Flutter"),),
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: Navbar(),
      ),
    );
  }
}

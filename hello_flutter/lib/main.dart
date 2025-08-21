import 'package:flutter/material.dart';
import 'package:hello_flutter/hello.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(child: Hello()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action to perform when the button is pressed
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hello_flutter/adios.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Hello Flutter"),
        Text("Omar"),
        Text("Rdz"),
        FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        Icon(Icons.add),
        Adios(),
      ],
    );
  }
}

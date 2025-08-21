import 'package:flutter/material.dart';

class Adios extends StatefulWidget {
  const Adios({super.key});

  @override
  State<Adios> createState() => _AdiosState();
}

class _AdiosState extends State<Adios> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Adios Flutter"),
        const Text("Adios Flutter"),
        const Text("Adios Flutter"),
        const Text("Adios Flutter"),
        const Text("Adios Flutter"),
      ],
    );
  }
}

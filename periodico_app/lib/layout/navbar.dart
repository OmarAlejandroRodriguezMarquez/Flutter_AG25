import 'package:flutter/material.dart';
import 'package:periodico_app/news/sports_news.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SportNews()));
                    }, icon: const Icon(Icons.sports_tennis)),

                     IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SportNews()));
                    }, icon: const Icon(Icons.autorenew)),
                    
        ]
      ),
    );
  }
}
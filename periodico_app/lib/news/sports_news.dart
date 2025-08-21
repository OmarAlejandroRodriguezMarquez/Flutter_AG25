import 'package:flutter/material.dart';
import 'package:periodico_app/layout/navbar.dart';

class SportNews extends StatelessWidget {
  const SportNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Noticias de deportes"),),
body: Center(
  child: Column(
    children: [
      Card(
        child: ListTile(
          leading: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMdZpSRl4rnjzCHvGKZBHBivoRL0nt5H8O1Q&s"),
          width: 100,
          height: 100,),
          title: Text("Noticia 1"),
          subtitle: Text("Contenido de la noticia"),
        ),
      ),
      Card(
        child: ListTile(
          title: Text("Noticia 2"),
          subtitle: Text("Contenido de la noticia 2"),
        ),
      )
    ],
  ),
),
bottomNavigationBar: Navbar(),
    );
  }
}
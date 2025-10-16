import 'package:flutter/material.dart';
import 'package:periodico_app/layout/navbar.dart';
import 'package:periodico_app/models/INoticia.dart';
import 'package:periodico_app/services/http_service.dart';

class SportNews extends StatefulWidget {
  const SportNews({super.key});

  @override
  State<SportNews> createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  final HttpService _httpService = HttpService();

  late Future<List<INoticia>> _futureNoticias;

  @override
  void initState() {
    super.initState();
    _futureNoticias = _httpService.getNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Noticias de deportes")),
      body: FutureBuilder<List<INoticia>>(
        future: _futureNoticias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error al cargar noticias: ${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay noticias disponibles"));
          }

          final noticias = snapshot.data!
              // Filtramos solo las de tipo "deportes"
              .where((n) => n.tipo.toLowerCase() == 'deportes')
              .toList();

          if (noticias.isEmpty) {
            return const Center(child: Text("No hay noticias de deportes"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final noticia = noticias[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noticia.titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        noticia.contenido,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(noticia.tipo),
                            backgroundColor: Colors.blue.shade100,
                          ),
                          Text(
                            // Fecha formateada a algo más legible
                            "${noticia.fecha.day}/${noticia.fecha.month}/${noticia.fecha.year}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}

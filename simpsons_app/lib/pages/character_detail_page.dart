import 'package:flutter/material.dart';
import 'package:simpsons_app/models/respuesta.dart';
import 'package:simpsons_app/services/api_Services.dart';

class CharacterDetailPage extends StatefulWidget {
  final int id;
  const CharacterDetailPage({super.key, required this.id});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Personaje')),
      body: FutureBuilder<Result>(
        future: apiService.getCharacterDetail(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No se encontró el personaje.'));
          }

          final c = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn.thesimpsonsapi.com${c.portraitPath}',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  c.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  c.occupation,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 12),
                Text("Género: ${c.gender}"),
                Text("Edad: ${c.age ?? 'Desconocida'}"),
                Text("Estado: ${c.status}"),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  "Frases icónicas:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                for (var phrase in c.phrases)
                  ListTile(title: Text("🗣️ $phrase")),
              ],
            ),
          );
        },
      ),
    );
  }
}

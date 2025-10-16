import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:periodico_app/models/INoticia.dart';

class HttpService {
  final String baseUrl = 'http://localhost:5261/api';

  Future<List<INoticia>> getNoticias() async {
    final response = await http.get(Uri.parse('$baseUrl/noticias/todas'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Si tu API devuelve directamente una lista:
      if (data is List) {
        return data.map((item) => INoticia.fromJson(item)).toList();
      }

      // Si devuelve un objeto con "results"
      if (data is Map && data.containsKey('results')) {
        return (data['results'] as List)
            .map((item) => INoticia.fromJson(item))
            .toList();
      }

      throw Exception('Formato de datos inesperado');
    } else {
      throw Exception('Error al obtener noticias');
    }
  }

  Future<INoticia> getNoticiaDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/noticia/$id'));

    if (response.statusCode == 200) {
      return INoticia.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener detalle de la noticia');
    }
  }
}

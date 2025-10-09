import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simpsons_app/models/respuesta.dart';

class ApiService {
  final String baseUrl = 'https://thesimpsonsapi.com/api';

  Future<List<Result>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));

    if (response.statusCode == 200) {
      final data = ResponseSimpson.fromJson(json.decode(response.body));
      return data.results;
    } else {
      throw Exception('Error al obtener personajes');
    }
  }

  Future<Result> getCharacterDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/characters/$id'));

    if (response.statusCode == 200) {
      return Result.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener detalle del personaje');
    }
  }
}

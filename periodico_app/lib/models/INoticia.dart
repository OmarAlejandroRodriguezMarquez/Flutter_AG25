import 'dart:convert';

INoticia iNoticiaFromJson(String str) => INoticia.fromJson(json.decode(str));

String iNoticiaToJson(INoticia data) => json.encode(data.toJson());

class INoticia {
  int id;
  String titulo;
  String contenido;
  String tipo;
  DateTime fecha;

  INoticia({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.tipo,
    required this.fecha,
  });

  factory INoticia.fromJson(Map<String, dynamic> json) => INoticia(
    id: json["id"],
    titulo: json["titulo"],
    contenido: json["contenido"],
    tipo: json["tipo"],
    fecha: DateTime.parse(json["fecha"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "contenido": contenido,
    "tipo": tipo,
    "fecha": fecha.toIso8601String(),
  };
}

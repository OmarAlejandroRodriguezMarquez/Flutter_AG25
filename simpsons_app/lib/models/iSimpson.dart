// To parse this JSON data, do
//
//     final iSimpson = iSimpsonFromJson(jsonString);

import 'dart:convert';

ISimpson iSimpsonFromJson(String str) => ISimpson.fromJson(json.decode(str));

String iSimpsonToJson(ISimpson data) => json.encode(data.toJson());

class ISimpson {
  final int id;
  final int age;
  final DateTime birthdate;
  final String gender;
  final String name;
  final String occupation;
  final String portraitPath;
  final List<String> phrases;
  final String status;

  ISimpson({
    required this.id,
    required this.age,
    required this.birthdate,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.portraitPath,
    required this.phrases,
    required this.status,
  });

  factory ISimpson.fromJson(Map<String, dynamic> json) => ISimpson(
    id: json["id"],
    age: json["age"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    name: json["name"],
    occupation: json["occupation"],
    portraitPath: json["portrait_path"],
    phrases: List<String>.from(json["phrases"].map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "birthdate":
        "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "name": name,
    "occupation": occupation,
    "portrait_path": portraitPath,
    "phrases": List<dynamic>.from(phrases.map((x) => x)),
    "status": status,
  };
}

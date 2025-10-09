import 'dart:convert';

ResponseSimpson responseSimpsonFromJson(String str) =>
    ResponseSimpson.fromJson(json.decode(str));

String responseSimpsonToJson(ResponseSimpson data) =>
    json.encode(data.toJson());

class ResponseSimpson {
  final int count;
  final String? next;
  final dynamic prev;
  final int pages;
  final List<Result> results;

  ResponseSimpson({
    required this.count,
    required this.next,
    required this.prev,
    required this.pages,
    required this.results,
  });

  factory ResponseSimpson.fromJson(Map<String, dynamic> json) =>
      ResponseSimpson(
        count: json["count"],
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        results: List<Result>.from(
          json["results"].map((x) => Result.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "prev": prev,
    "pages": pages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  final int id;
  final int? age;
  final DateTime? birthdate;
  final String gender;
  final String name;
  final String occupation;
  final String portraitPath;
  final List<String> phrases;
  final String status;

  Result({
    required this.id,
    this.age,
    this.birthdate,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.portraitPath,
    required this.phrases,
    required this.status,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    age: json["age"],
    birthdate: json["birthdate"] == null
        ? null
        : DateTime.tryParse(json["birthdate"]),
    gender: json["gender"] ?? '',
    name: json["name"] ?? '',
    occupation: json["occupation"] ?? '',
    portraitPath: json["portrait_path"] ?? '',
    phrases: json["phrases"] == null
        ? []
        : List<String>.from(json["phrases"].map((x) => x)),
    status: json["status"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "birthdate": birthdate?.toIso8601String(),
    "gender": gender,
    "name": name,
    "occupation": occupation,
    "portrait_path": portraitPath,
    "phrases": List<dynamic>.from(phrases.map((x) => x)),
    "status": status,
  };
}

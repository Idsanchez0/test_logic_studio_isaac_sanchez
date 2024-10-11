import 'dart:convert';

class Archetype {
  String name;
  Archetype({required this.name});
  factory Archetype.fromRawJson(String str) =>
      Archetype.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Archetype.fromJson(Map<String, dynamic> json) =>
      Archetype(name: json["archetype_name"]);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

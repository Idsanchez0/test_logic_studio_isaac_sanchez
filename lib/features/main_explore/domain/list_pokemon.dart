import 'dart:convert';

class ListPokemon {
  String name;
  String id;
  ListPokemon({required this.name, required this.id});
  factory ListPokemon.fromRawJson(String str) =>
      ListPokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListPokemon.fromJson(Map<String, dynamic> json) => ListPokemon(
        name: json["name"],
        id: json["url"].toString().split('pokemon/').last.replaceAll('/', ''),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

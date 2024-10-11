import 'dart:convert';

class Moves {
  String name;

  Moves({
    required this.name,
  });

  factory Moves.fromRawJson(String str) => Moves.fromJson(json.decode(str));

  factory Moves.fromJson(Map<String, dynamic> json) => Moves(
        name: json['move']["name"],
      );
}

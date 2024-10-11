import 'dart:convert';

import 'package:test_isaac/features/detail_card/domain/stats.dart';

import 'moves.dart';

class DetailPokemon {
  num height;
  num weight;
  List<Moves> moves;
  List<Stats> stats;
  DetailPokemon(
      {required this.height,
      required this.weight,
      required this.moves,
      required this.stats});
  factory DetailPokemon.fromRawJson(String str) =>
      DetailPokemon.fromJson(json.decode(str));

  factory DetailPokemon.fromJson(Map<String, dynamic> json) => DetailPokemon(
        height: json["height"],
        weight: json["weight"],
        stats: List<Stats>.from(json["stats"].map((x) => Stats.fromJson(x))),
        moves: List<Moves>.from(json["moves"].map((x) => Moves.fromJson(x))),
      );
}

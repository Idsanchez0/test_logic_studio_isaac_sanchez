import 'dart:convert';

class Stats {
  String name;
  num baseStat;

  Stats({required this.name, required this.baseStat});

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  factory Stats.fromJson(Map<String, dynamic> json) =>
      Stats(name: json['stat']["name"], baseStat: json['base_stat']);
}

import 'dart:convert';

import 'package:test_isaac/features/detail_card/domain/price_card.dart';

class DetailCard {
  num id;
  String name;
  String? type;
  String? desc;
  String? archetype;
  String? attribute;
  String? race;
  num? atk;
  num? def;
  num? level;
  List<String>? typeLine;
  PriceCard prices;
  DetailCard(
      {required this.id,
      required this.name,
      this.type,
      this.desc,
      this.archetype,
      this.attribute,
      this.race,
      this.atk,
      this.def,
      this.level,
      this.typeLine,
      required this.prices});
  factory DetailCard.fromRawJson(String str) =>
      DetailCard.fromJson(json.decode(str));

  factory DetailCard.fromJson(Map<String, dynamic> json) => DetailCard(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        desc: json["desc"],
        archetype: json["archetype"],
        attribute: json["attribute"],
        race: json["race"],
        atk: json["atk"],
        def: json["def"],
        level: json["level"],
        typeLine: json["typeline"] != null
            ? List<String>.from(json["typeline"])
            : null,
        prices: PriceCard.fromJson(json["card_prices"][0]),
      );
}

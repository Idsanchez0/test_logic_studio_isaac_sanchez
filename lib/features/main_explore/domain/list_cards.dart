import 'dart:convert';

class ListCards {
  String name;
  num id;
  String image;
  String? archetype;
  ListCards(
      {required this.name,
      required this.id,
      required this.image,
      this.archetype});
  factory ListCards.fromRawJson(String str) =>
      ListCards.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListCards.fromJson(Map<String, dynamic> json) => ListCards(
      name: json["name"],
      id: json["id"],
      image: json["card_images"] != null && json["card_images"].isNotEmpty
          ? json["card_images"][0]["image_url"]
          : '',
      archetype: json["archetype"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

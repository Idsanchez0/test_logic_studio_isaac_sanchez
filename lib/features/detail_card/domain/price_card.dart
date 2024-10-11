import 'dart:convert';

class PriceCard {
  String cardMarket;
  String tcgPlayer;
  String ebay;
  String amazon;
  String coolStuffing;

  PriceCard({
    required this.cardMarket,
    required this.tcgPlayer,
    required this.ebay,
    required this.amazon,
    required this.coolStuffing,
  });

  factory PriceCard.fromRawJson(String str) =>
      PriceCard.fromJson(json.decode(str));

  factory PriceCard.fromJson(Map<String, dynamic> json) => PriceCard(
        cardMarket: json['cardmarket_price'],
        tcgPlayer: json['tcgplayer_price'],
        ebay: json['ebay_price'],
        amazon: json['amazon_price'],
        coolStuffing: json['coolstuffinc_price'],
      );
}

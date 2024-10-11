import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_isaac/features/detail_card/domain/detail_card.dart';

import '../../../core/network/network.dart';

class DetailCardRepository {
  DetailCardRepository();

  Future<List<DetailCard>> getDetailCard({required String id}) async {
    try {
      final response = await http.get(
        Uri.parse('${network.urlBackend}/cardinfo.php?id=$id'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = [];
        jsonList.add(data['data'][0]);
        List<DetailCard> topClinicsList =
            jsonList.map((item) => DetailCard.fromJson(item)).toList();
        return topClinicsList;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final detailCardRepositoryProvider = Provider<DetailCardRepository>(
  (ref) => DetailCardRepository(),
);

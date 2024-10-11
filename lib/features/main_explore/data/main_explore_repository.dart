import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_isaac/features/main_explore/domain/main_explore_model.dart';

import '../../../core/network/network.dart';

class MainExploreRepository {
  MainExploreRepository();

  Future<List<MainExploreModel>> getImages() async {
    try {
      final response = await http.get(
        Uri.parse('${network.urlBackend}/photos'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<MainExploreModel> topClinicsList =
            jsonList.map((item) => MainExploreModel.fromJson(item)).toList();
        return topClinicsList;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final mainExploreRepositoryProvider = Provider<MainExploreRepository>(
  (ref) => MainExploreRepository(),
);

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_isaac/features/main_explore/domain/list_pokemon.dart';

import '../../../core/network/network.dart';

class MainExploreRepository {
  MainExploreRepository();

  Future<List<ListPokemon>> getPokemon({required String offset}) async {
    try {
      final response = await http.get(
        Uri.parse('${network.urlBackend}/pokemon?offset=$offset&limit=20'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = data['results'];
        List<ListPokemon> topClinicsList =
            jsonList.map((item) => ListPokemon.fromJson(item)).toList();
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

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/network/network.dart';
import '../domain/detail_pokemon.dart';

class DetailPokemonRepository {
  DetailPokemonRepository();

  Future<List<DetailPokemon>> getDetailPokemon({required String id}) async {
    try {
      final response = await http.get(
        Uri.parse('${network.urlBackend}/pokemon/$id'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = [];
        jsonList.add(data);
        List<DetailPokemon> topClinicsList =
            jsonList.map((item) => DetailPokemon.fromJson(item)).toList();
        return topClinicsList;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final detailPokemonRepositoryProvider = Provider<DetailPokemonRepository>(
  (ref) => DetailPokemonRepository(),
);

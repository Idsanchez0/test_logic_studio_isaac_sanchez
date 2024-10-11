import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_isaac/features/main_explore/domain/archetype.dart';
import 'package:test_isaac/features/main_explore/domain/list_cards.dart';

import '../../../core/network/network.dart';

class MainExploreRepository {
  MainExploreRepository();

  Future<List<ListCards>> getListCards() async {
    try {
      final response = await http.get(
        Uri.parse('${network.urlBackend}/cardinfo.php'),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = data['data'];
        List<ListCards> topClinicsList =
            jsonList.map((item) => ListCards.fromJson(item)).toList();
        return topClinicsList;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ListCards>> getBanListCards() async {
    try {
      final response = await http.get(
        Uri.parse(
            "${network.urlBackend}/cardinfo.php?banlist=tcg&level=4&sort=name"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = data['data'];
        List<ListCards> topClinicsList =
            jsonList.map((item) => ListCards.fromJson(item)).toList();
        return topClinicsList;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Archetype>> getArchetypeList() async {
    try {
      final response = await http.get(
        Uri.parse("${network.urlBackend}/archetypes.php"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> jsonList = data;
        List<Archetype> topClinicsList =
            jsonList.map((item) => Archetype.fromJson(item)).toList();
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

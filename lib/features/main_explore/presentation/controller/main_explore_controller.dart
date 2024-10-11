import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac/features/main_explore/data/main_explore_repository.dart';
import 'package:test_isaac/features/main_explore/domain/archetype.dart';
import 'package:test_isaac/features/main_explore/domain/list_cards.dart';
import 'package:test_isaac/features/main_explore/presentation/state/main_explore_state.dart';

class MainExploreController extends StateNotifier<MainExploreState> {
  MainExploreController({required this.mainExploreRepository})
      : super(MainExploreState());
  final MainExploreRepository mainExploreRepository;

  Future<bool> getCards() async {
    state = state.copyWith(scrollController: ScrollController(), offset: 0);
    List<ListCards> banData = await mainExploreRepository.getBanListCards();
    List<ListCards> data = await mainExploreRepository.getListCards();
    List<ListCards> filteredData = data.where((card) {
      return !banData.any((bannedCard) => bannedCard.id == card.id);
    }).toList();
    List<Archetype> archetype = await mainExploreRepository.getArchetypeList();
    List<String> listArchetype = [];
    for (var item in archetype) {
      listArchetype.add(item.name);
    }
    state = state.copyWith(
      listData: filteredData,
      listArchetype: listArchetype,
      originalListData: filteredData,
      offset: 20,
    );
    if (data.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loadMoreItems() async {
    int currentLimit = 0;
    if (state.offset! < 13360) {
      currentLimit = state.offset! + 20;
    } else {
      currentLimit = state.listData!.length;
    }
    state = state.copyWith(offset: currentLimit);
  }

  Future<void> filteredListArchetype({required String archetype}) async {
    List<ListCards> filteredData = state.originalListData!.where((card) {
      return card.archetype.toString() == archetype;
    }).toList();
    state = state.copyWith(
      listData: filteredData,
    );
  }

  addFavorite(int id) {
    final newFavorite = Set<int>.from(state.favorite ?? <int>{});

    if (newFavorite.contains(id)) {
      newFavorite.remove(id);
    } else {
      newFavorite.add(id);
    }

    state = state.copyWith(favorite: newFavorite);
  }
}

final mainExploreController =
    StateNotifierProvider<MainExploreController, MainExploreState>((ref) {
  return MainExploreController(
      mainExploreRepository: ref.watch(mainExploreRepositoryProvider));
});

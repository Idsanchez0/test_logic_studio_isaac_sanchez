import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac/features/main_explore/data/main_explore_repository.dart';
import 'package:test_isaac/features/main_explore/domain/list_pokemon.dart';
import 'package:test_isaac/features/main_explore/presentation/state/main_explore_state.dart';

class MainExploreController extends StateNotifier<MainExploreState> {
  MainExploreController({required this.mainExploreRepository})
      : super(MainExploreState());
  final MainExploreRepository mainExploreRepository;

  Future<bool> getImages() async {
    state = state.copyWith(scrollController: ScrollController(), offset: 0);
    List<ListPokemon> data =
        await mainExploreRepository.getPokemon(offset: state.offset.toString());
    state = state.copyWith(
      listData: data,
    );
    if (data.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loadMoreItems() async {
    int currentLimit = 0;
    if (state.offset! < 1000) {
      currentLimit = state.offset! + 20;
    } else {
      currentLimit = state.listData!.length;
    }
    state = state.copyWith(offset: currentLimit);
    log('currentLimit= $currentLimit');
    List<ListPokemon> data =
        await mainExploreRepository.getPokemon(offset: currentLimit.toString());
    List<ListPokemon> dataSave = state.listData!;
    if (data.isNotEmpty) {
      dataSave.addAll(data);
    }
    state = state.copyWith(listData: dataSave);
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

import 'package:flutter/material.dart';
import 'package:test_isaac/features/main_explore/domain/list_pokemon.dart';

class MainExploreState {
  final List<ListPokemon>? listData;
  final int? offset;
  final Set<int>? favorite;
  final ScrollController? scrollController;
  MainExploreState(
      {this.listData, this.offset, this.scrollController, this.favorite});

  MainExploreState copyWith(
      {List<ListPokemon>? listData,
      int? index,
      Set<int>? favorite,
      int? offset,
      ScrollController? scrollController}) {
    return MainExploreState(
        listData: listData ?? this.listData,
        offset: offset ?? this.offset,
        favorite: favorite ?? this.favorite,
        scrollController: scrollController ?? this.scrollController);
  }
}

import 'package:flutter/material.dart';

import '../../domain/list_cards.dart';

class MainExploreState {
  final List<ListCards>? listData;
  final List<ListCards>? originalListData;
  final int? offset;
  final Set<int>? favorite;
  final List<String>? listArchetype;
  final ScrollController? scrollController;
  MainExploreState(
      {this.listData,
      this.originalListData,
      this.offset,
      this.scrollController,
      this.favorite,
      this.listArchetype});

  MainExploreState copyWith(
      {List<ListCards>? listData,
      List<ListCards>? originalListData,
      int? index,
      Set<int>? favorite,
      List<String>? listArchetype,
      int? offset,
      ScrollController? scrollController}) {
    return MainExploreState(
        listData: listData ?? this.listData,
        originalListData: originalListData ?? this.originalListData,
        listArchetype: listArchetype ?? this.listArchetype,
        offset: offset ?? this.offset,
        favorite: favorite ?? this.favorite,
        scrollController: scrollController ?? this.scrollController);
  }
}

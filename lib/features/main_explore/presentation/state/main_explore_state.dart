import 'package:flutter/material.dart';

import '../../domain/main_explore_model.dart';

class MainExploreState {
  final List<MainExploreModel>? listData;
  final int? limit;
  final ScrollController? scrollController;
  MainExploreState({this.listData, this.limit, this.scrollController});

  MainExploreState copyWith(
      {List<MainExploreModel>? listData,
      int? index,
      int? limit,
      ScrollController? scrollController}) {
    return MainExploreState(
        listData: listData ?? this.listData,
        limit: limit ?? this.limit,
        scrollController: scrollController ?? this.scrollController);
  }
}

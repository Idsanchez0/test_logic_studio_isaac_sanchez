import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac/features/main_explore/data/main_explore_repository.dart';
import 'package:test_isaac/features/main_explore/domain/main_explore_model.dart';
import 'package:test_isaac/features/main_explore/presentation/state/main_explore_state.dart';

class MainExploreController extends StateNotifier<MainExploreState> {
  MainExploreController({required this.mainExploreRepository})
      : super(MainExploreState());
  final MainExploreRepository mainExploreRepository;

  Future<bool> getImages() async {
    state = state.copyWith(scrollController: ScrollController(), limit: 10);
    List<MainExploreModel> data = await mainExploreRepository.getImages();
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
    if (state.limit! < state.listData!.length) {
      currentLimit = state.limit! + 10;
    } else {
      currentLimit = state.listData!.length;
    }
    state = state.copyWith(limit: currentLimit);
  }
}

final mainExploreController =
    StateNotifierProvider<MainExploreController, MainExploreState>((ref) {
  return MainExploreController(
      mainExploreRepository: ref.watch(mainExploreRepositoryProvider));
});

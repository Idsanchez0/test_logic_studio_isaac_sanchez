import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/detail_card_repository.dart';
import '../../domain/detail_card.dart';
import '../state/detail_card_state.dart';

class DetailCardController extends StateNotifier<DetailCardState> {
  DetailCardController({required this.detailCardRepository})
      : super(DetailCardState());
  final DetailCardRepository detailCardRepository;

  Future<bool> getDetail({required String id}) async {
    List<DetailCard> data = await detailCardRepository.getDetailCard(id: id);
    state = state.copyWith(dataDetail: data.first, option: 'stats');
    log('data de la carta ${data.first.id.toString()}');
    log('LIST TYPE ${data.first.typeLine}');
    if (data.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  selectOption({required String selected}) {
    state = state.copyWith(option: selected);
  }
}

final detailCardController =
    StateNotifierProvider<DetailCardController, DetailCardState>((ref) {
  return DetailCardController(
      detailCardRepository: ref.watch(detailCardRepositoryProvider));
});

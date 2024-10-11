import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/detail_pokemon_repository.dart';
import '../../domain/detail_pokemon.dart';
import '../state/detail_pokemon_state.dart';

class DetailPokemonController extends StateNotifier<DetailPokemonState> {
  DetailPokemonController({required this.detailPokemonRepository})
      : super(DetailPokemonState());
  final DetailPokemonRepository detailPokemonRepository;

  Future<bool> getDetail({required String id}) async {
    List<DetailPokemon> data =
        await detailPokemonRepository.getDetailPokemon(id: id);
    state = state.copyWith(dataDetail: data.first, option: 'stats');
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

final detailPokemonController =
    StateNotifierProvider<DetailPokemonController, DetailPokemonState>((ref) {
  return DetailPokemonController(
      detailPokemonRepository: ref.watch(detailPokemonRepositoryProvider));
});

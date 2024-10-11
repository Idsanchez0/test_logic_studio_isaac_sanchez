import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/core/ui/design/templates/card/pokemon_card.dart';
import 'package:test_isaac/features/main_explore/domain/list_pokemon.dart';
import 'package:test_isaac/features/main_explore/presentation/controller/main_explore_controller.dart';

class ListDataWidget extends StatefulWidget {
  const ListDataWidget(
      {super.key,
      required this.initData,
      required this.ref,
      required this.data});
  final Function initData;
  final WidgetRef ref;
  final List<ListPokemon> data;

  @override
  State<ListDataWidget> createState() => _ListDataWidgetState();
}

class _ListDataWidgetState extends State<ListDataWidget> {
  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(mainExploreController);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.data.length >= 2 ? 2 : 1,
        childAspectRatio: 1.sp,
        crossAxisSpacing: 15.sp,
        mainAxisSpacing: 15.sp,
      ),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        bool isSelected = state.favorite != null &&
            state.favorite!
                .contains(int.parse(widget.data[index].id.toString()));
        return GestureDetector(
          child: PokemonCard(
            title: widget.data[index].name.toString(),
            image:
                services.createUrlImage(id: widget.data[index].id.toString()),
            id: widget.data[index].id.toString(),
            isSelected: isSelected,
            ref: widget.ref,
          ),
        );
      },
    );
  }
}

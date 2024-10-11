import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/design/templates/card/pokemon_card.dart';
import 'package:test_isaac/features/main_explore/domain/list_cards.dart';
import 'package:test_isaac/features/main_explore/presentation/controller/main_explore_controller.dart';

class ListDataWidget extends StatefulWidget {
  const ListDataWidget(
      {super.key,
      required this.initData,
      required this.ref,
      required this.data});
  final Function initData;
  final WidgetRef ref;
  final List<ListCards> data;

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
        childAspectRatio: .7.sp,
        crossAxisSpacing: 15.sp,
        mainAxisSpacing: 15.sp,
      ),
      itemCount: widget.data.isEmpty
          ? 0
          : widget.data.length > 20
              ? state.offset
              : widget.data.length < 20
                  ? widget.data.length
                  : 1,
      itemBuilder: (context, index) {
        bool isSelected = state.favorite != null &&
            state.favorite!
                .contains(int.parse(widget.data[index].id.toString()));
        return GestureDetector(
          child: OptionCard(
            title: widget.data[index].name,
            image: widget.data[index].image.toString(),
            id: widget.data[index].id.toString(),
            isSelected: isSelected,
            ref: widget.ref,
          ),
        );
      },
    );
  }
}

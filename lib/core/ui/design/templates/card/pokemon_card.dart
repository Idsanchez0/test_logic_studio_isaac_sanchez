import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/md_p.dart';

import '../../../../../features/main_explore/presentation/controller/main_explore_controller.dart';
import '../../../utils/colors/color_generator.dart';
import '../../../utils/routes/routes.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.id,
      required this.image,
      required this.ref});
  final bool isSelected;
  final String image;
  final String title;
  final String id;
  final WidgetRef ref;
  @override
  State<PokemonCard> createState() => _PokemonCard();
}

class _PokemonCard extends State<PokemonCard> {
  Color colorCard = Colors.transparent;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => validateColorCard());
  }

  validateColorCard() async {
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color colorCardGenerated =
        await colorsGenerator.generateCardColor(widget.image, false);
    if (mounted) {
      setState(() {
        colorCard = colorCardGenerated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.ref.watch(mainExploreController.notifier);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          color: colorCard,
          image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.contain,
              opacity: .95),
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () =>
                controller.addFavorite(int.parse(widget.id.toString())),
            child: Icon(
              widget.isSelected
                  ? PhosphorIconsFill.heart
                  : PhosphorIcons.heart(),
              color: widget.isSelected ? Colors.red : Colors.white,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MdP(
                      title: widget.title,
                      color: Colors.white,
                      align: TextAlign.start,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                  onTap: () => routes.pokemonDetail(
                      id: widget.id,
                      name: widget.title,
                      context: context,
                      isSelected: widget.isSelected),
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

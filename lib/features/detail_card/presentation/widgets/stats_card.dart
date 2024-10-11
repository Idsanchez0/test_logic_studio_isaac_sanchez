import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/features/detail_card/presentation/widgets/stast_item.dart';

import '../../../../core/ui/utils/colors/color_generator.dart';
import '../controller/detail_pokemon_controller.dart';

class StatsCard extends StatefulWidget {
  const StatsCard({
    super.key,
    required this.id,
    required this.ref,
  });
  final String id;
  final WidgetRef ref;
  @override
  State<StatsCard> createState() => _StatsCard();
}

class _StatsCard extends State<StatsCard> {
  Color colorCard = Colors.transparent;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => validateColorCard());
  }

  validateColorCard() async {
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color colorCardGenerated = await colorsGenerator.generateCardColor(
        services.createUrlImage(id: widget.id), false);
    if (mounted) {
      setState(() {
        colorCard = colorCardGenerated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(detailPokemonController);
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.9),
                colorCard,
              ],
              begin: const FractionalOffset(0.0, 2.5),
              end: const FractionalOffset(3.5, .5),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: ListView.builder(
            itemCount: state.dataDetail!.stats.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.only(bottom: 8.sp),
                  child: StatsItem(
                      image: services.createUrlImage(id: widget.id),
                      title: state.dataDetail!.stats[index].name,
                      colorCard: colorCard,
                      value:
                          state.dataDetail!.stats[index].baseStat.toString()));
            }));
  }
}

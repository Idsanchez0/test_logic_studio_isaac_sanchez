import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/features/detail_card/presentation/widgets/stast_item.dart';

import '../../../../core/ui/utils/colors/color_generator.dart';
import '../controller/detail_card_controller.dart';
import 'attributes.dart';

class StatsCard extends StatefulWidget {
  const StatsCard({
    super.key,
    required this.id,
    required this.image,
    required this.ref,
  });
  final String id;
  final String image;
  final WidgetRef ref;
  @override
  State<StatsCard> createState() => _StatsCard();
}

class _StatsCard extends State<StatsCard> {
  Color colorCard = Colors.transparent;
  List<String> listType = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => validateColorCard());
  }

  validateColorCard() async {
    var state = widget.ref.watch(detailCardController);
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color colorCardGenerated = await colorsGenerator.generateCardColor(
        services.createUrlImage(id: widget.id), false);
    if (mounted) {
      setState(() {
        colorCard = colorCardGenerated;
        listType = state.dataDetail!.typeLine!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(detailCardController);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Attributes(
                      title: 'Tipo', text: state.dataDetail!.type.toString()),
                ),
                if (state.dataDetail!.archetype != null) ...[
                  Expanded(
                    child: Attributes(
                        title: 'Arquetipo',
                        text: state.dataDetail!.archetype.toString()),
                  ),
                ],
                if (state.dataDetail!.race != null) ...[
                  Expanded(
                    child: Attributes(
                        title: 'Raza', text: state.dataDetail!.race.toString()),
                  )
                ],
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            if (state.dataDetail!.typeLine != null) ...[
              Wrap(
                children: [
                  for (var item in state.dataDetail!.typeLine!) ...[
                    Expanded(
                      child:
                          Attributes(title: 'Type Line', text: item.toString()),
                    ),
                  ]
                ],
              )
            ],
            SizedBox(
              height: 10.sp,
            ),
            Container(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
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
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    if (state.dataDetail!.atk != null) ...[
                      StatsItem(
                          title: 'ATK',
                          colorCard: colorCard,
                          value: state.dataDetail!.atk.toString())
                    ],
                    if (state.dataDetail!.def != null) ...[
                      StatsItem(
                          title: 'DEF',
                          colorCard: colorCard,
                          value: state.dataDetail!.def.toString())
                    ],
                    if (state.dataDetail!.level != null) ...[
                      StatsItem(
                          title: 'LEVEL',
                          colorCard: colorCard,
                          star: true,
                          value: state.dataDetail!.level.toString())
                    ]
                  ],
                ))
          ],
        ));
  }
}

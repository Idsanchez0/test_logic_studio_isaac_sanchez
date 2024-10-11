import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/md_p.dart';

import '../../../../core/ui/utils/colors/color_generator.dart';
import '../controller/detail_pokemon_controller.dart';

class MovesCard extends StatefulWidget {
  const MovesCard({
    super.key,
    required this.id,
    required this.ref,
  });
  final String id;
  final WidgetRef ref;
  @override
  State<MovesCard> createState() => _MovesCard();
}

class _MovesCard extends State<MovesCard> {
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
            end: const FractionalOffset(1.5, .5),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          for (var item in state.dataDetail!.moves)
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.sp, horizontal: 5.sp),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.all(Radius.circular(50.sp))),
                  child: MdP(
                      title: services.firstLetterUpperCase(title: item.name),
                      color: Colors.white,
                      align: TextAlign.center,
                      fontWeight: FontWeight.normal),
                ))
        ],
      ),
    );
  }
}

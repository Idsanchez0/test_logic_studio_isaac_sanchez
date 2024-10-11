import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/features/detail_card/presentation/widgets/attributes.dart';

import '../../../../core/ui/utils/colors/color_generator.dart';
import '../controller/detail_card_controller.dart';

class PricesCard extends StatefulWidget {
  const PricesCard({
    super.key,
    required this.id,
    required this.ref,
  });
  final String id;
  final WidgetRef ref;
  @override
  State<PricesCard> createState() => _PricesCard();
}

class _PricesCard extends State<PricesCard> {
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
    var state = widget.ref.watch(detailCardController);
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
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          if (state.dataDetail!.prices.cardMarket.isNotEmpty) ...[
            Attributes(
                title: 'Card Market',
                text: '\$ ${state.dataDetail!.prices.cardMarket.toString()}')
          ],
          if (state.dataDetail!.prices.amazon.isNotEmpty) ...[
            Attributes(
                title: 'Amazon',
                text: '\$ ${state.dataDetail!.prices.amazon.toString()}')
          ],
          if (state.dataDetail!.prices.ebay.isNotEmpty) ...[
            Attributes(
                title: 'Ebay',
                text: '\$ ${state.dataDetail!.prices.ebay.toString()}')
          ],
          if (state.dataDetail!.prices.tcgPlayer.isNotEmpty) ...[
            Attributes(
                title: 'TCG Player',
                text: '\$ ${state.dataDetail!.prices.tcgPlayer.toString()}')
          ],
          if (state.dataDetail!.prices.coolStuffing.isNotEmpty) ...[
            Attributes(
                title: 'Cool Stuffinc',
                text: '\$ ${state.dataDetail!.prices.coolStuffing.toString()}')
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/features/detail_card/presentation/widgets/attributes.dart';

import '../../../../core/ui/utils/colors/colors.dart';
import '../controller/detail_card_controller.dart';

class PricesCard extends StatelessWidget {
  const PricesCard({
    super.key,
    required this.id,
    required this.ref,
  });
  final String id;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(detailCardController);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
        gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.9),
              colors.primary500.withOpacity(.5),
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

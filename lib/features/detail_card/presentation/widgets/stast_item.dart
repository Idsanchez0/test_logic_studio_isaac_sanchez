import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';

import '../../../../core/ui/design/atoms/text/body/sm_p.dart';

class StatsItem extends StatelessWidget {
  const StatsItem(
      {super.key,
      required this.title,
      required this.value,
      required this.colorCard,
      this.star});
  final String title;
  final String value;
  final Color colorCard;
  final bool? star;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(5),
      },
      children: [
        TableRow(children: [
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: SmP(
                  title: services.firstLetterUpperCase(title: title),
                  color: Colors.white,
                  align: TextAlign.start,
                  fontWeight: FontWeight.w500)),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: SmP(
                  title: value,
                  color: colors.primary500,
                  align: TextAlign.start,
                  fontWeight: FontWeight.w700)),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: star != null
                  ? SizedBox(
                      height: 20.sp,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          itemCount: int.parse(value.toString()),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Icon(
                              PhosphorIconsFill.star,
                              color: colors.warning400,
                            );
                          }))
                  : LinearPercentIndicator(
                      animation: true,
                      lineHeight: 8.sp,
                      animationDuration: 800,
                      backgroundColor: Colors.grey.withOpacity(.2),
                      percent: double.parse(value) >= 100
                          ? 1.0
                          : services.percentReturn(value),
                      barRadius: Radius.circular(50.sp),
                      progressColor: colors.primary500,
                    )),
        ])
      ],
    );
  }
}

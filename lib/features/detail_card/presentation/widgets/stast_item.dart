import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_isaac/core/services/services.dart';

import '../../../../core/ui/design/atoms/text/body/sm_p.dart';

class StatsItem extends StatefulWidget {
  const StatsItem(
      {super.key,
      required this.image,
      required this.title,
      required this.value,
      required this.colorCard});
  final String image;
  final String title;
  final String value;
  final Color colorCard;
  @override
  State<StatsItem> createState() => _StatsItem();
}

class _StatsItem extends State<StatsItem> {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(5),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(5),
      },
      children: [
        TableRow(children: [
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: SmP(
                  title: services.firstLetterUpperCase(title: widget.title),
                  color: Colors.white,
                  align: TextAlign.start,
                  fontWeight: FontWeight.w500)),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: SmP(
                  title: widget.value,
                  color: widget.colorCard,
                  align: TextAlign.start,
                  fontWeight: FontWeight.w700)),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 8.sp,
                animationDuration: 800,
                backgroundColor: Colors.grey.withOpacity(.2),
                percent: double.parse(widget.value) >= 100
                    ? 1.0
                    : services.percentReturn(widget.value),
                barRadius: Radius.circular(50.sp),
                progressColor: widget.colorCard,
              )),
        ])
      ],
    );
  }
}

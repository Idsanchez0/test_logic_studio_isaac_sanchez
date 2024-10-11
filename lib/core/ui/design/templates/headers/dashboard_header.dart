import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';

import '../../atoms/body/sm_p.dart';
import '../../atoms/header/h3.dart';

class DashboardHeader extends StatefulWidget implements PreferredSizeWidget {
  const DashboardHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  State<DashboardHeader> createState() => _DashboardHeader();
}

class _DashboardHeader extends State<DashboardHeader> {
  String env = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black.withOpacity(.85),
        surfaceTintColor: Colors.black.withOpacity(.85),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.sp),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.sp),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(bottom: 8.sp),
          alignment: Alignment.center,
          child: GestureDetector(
              child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(9),
            },
            children: [
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Container(
                      width: 40.sp,
                      height: 40.sp,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.white)),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_2_rounded,
                        size: 30.sp,
                        color: colors.primary500,
                      ),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Container(
                      color: Colors.transparent,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H3(
                              title: 'Hola !',
                              color: Colors.white,
                              align: TextAlign.start),
                          SmP(
                              title: '¿Qué deseas hacer hoy?',
                              color: Colors.white,
                              align: TextAlign.start,
                              fontWeight: FontWeight.normal)
                        ],
                      ),
                    ))
              ])
            ],
          )),
        ));
  }
}

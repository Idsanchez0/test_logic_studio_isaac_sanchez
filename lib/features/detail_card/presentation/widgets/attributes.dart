import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';

import '../../../../core/ui/design/atoms/text/body/md_p.dart';
import '../../../../core/ui/design/atoms/text/body/sm_p.dart';

class Attributes extends StatefulWidget {
  const Attributes({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;
  @override
  State<Attributes> createState() => _Attributes();
}

class _Attributes extends State<Attributes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 5.sp),
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.all(Radius.circular(10.sp))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmP(
              title: '${widget.title}:',
              color: colors.neutral400,
              align: TextAlign.start,
              fontWeight: FontWeight.bold),
          MdP(
              title: widget.text,
              color: Colors.white,
              align: TextAlign.start,
              fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}

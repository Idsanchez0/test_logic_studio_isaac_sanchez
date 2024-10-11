import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LgP extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const LgP(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight});
  @override
  State<LgP> createState() => _LgP();
}

class _LgP extends State<LgP> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontSize: 16.sp,
          height: 1.5),
    );
  }
}

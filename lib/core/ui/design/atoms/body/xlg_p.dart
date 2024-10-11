import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XlgP extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const XlgP(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight});
  @override
  State<XlgP> createState() => _XlgP();
}

class _XlgP extends State<XlgP> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontSize: 18.sp,
          height: 1.5),
    );
  }
}

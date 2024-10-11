import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MdP extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const MdP(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight});
  @override
  State<MdP> createState() => _MdP();
}

class _MdP extends State<MdP> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontSize: 14.sp,
          height: 1.5),
    );
  }
}

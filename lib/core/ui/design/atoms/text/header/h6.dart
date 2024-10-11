import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H6 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H6(
      {super.key,
      required this.title,
      required this.color,
      required this.align});
  @override
  State<H6> createState() => _H6();
}

class _H6 extends State<H6> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          height: 1.5),
    );
  }
}

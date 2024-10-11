import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H3 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H3(
      {super.key,
      required this.title,
      required this.color,
      required this.align});
  @override
  State<H3> createState() => _H3();
}

class _H3 extends State<H3> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
          height: 1.5),
    );
  }
}

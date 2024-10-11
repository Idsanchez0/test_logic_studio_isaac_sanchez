import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H2 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H2(
      {super.key,
      required this.title,
      required this.color,
      required this.align});
  @override
  State<H2> createState() => _H2();
}

class _H2 extends State<H2> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
          height: 1.5),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H5 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H5(
      {super.key,
      required this.title,
      required this.color,
      required this.align});
  @override
  State<H5> createState() => _H5();
}

class _H5 extends State<H5> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontSize: 19.sp,
          height: 1.5),
    );
  }
}

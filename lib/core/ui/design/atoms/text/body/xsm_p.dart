import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XsmP extends StatelessWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const XsmP(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: 10.sp, height: 1.5),
    );
  }
}

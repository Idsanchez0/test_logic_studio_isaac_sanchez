import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/colors/colors.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});
  @override
  State<Loader> createState() => _Loader();
}

class _Loader extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: colors.primary500,
        size: 100.sp,
      ),
    );
  }
}

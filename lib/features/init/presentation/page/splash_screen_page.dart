import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';
import 'package:test_isaac/core/ui/utils/routes/routes.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => routes.mainExplore(context: context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterLogo(
          size: 300.sp,
        ),
        SizedBox(
          height: 20.sp,
        ),
        SpinKitFadingCircle(
          color: colors.secondary500,
          size: 35.sp,
        )
      ],
    ));
  }
}

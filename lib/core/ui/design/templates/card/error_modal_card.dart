import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../utils/colors/colors.dart';
import '../../atoms/text/body/md_p.dart';
import '../../atoms/text/header/h2.dart';
import '../../molecules/buttons/buttons_custom.dart';

class ErrorModalCard extends StatefulWidget {
  final String title;
  final String message;
  const ErrorModalCard({super.key, required this.message, required this.title});
  @override
  State<ErrorModalCard> createState() => _ErrorModalCard();
}

class _ErrorModalCard extends State<ErrorModalCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300.sp,
      width: 250.sp,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.sp))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIconsFill.xCircle,
            color: colors.error500,
            size: 60.sp,
          ),
          SizedBox(
            height: 10.sp,
          ),
          H2(title: widget.title, color: Colors.red, align: TextAlign.center),
          SizedBox(
            height: 20.sp,
          ),
          MdP(
              title: widget.message,
              color: Colors.black,
              align: TextAlign.center,
              fontWeight: FontWeight.w500),
          SizedBox(
            height: 30.sp,
          ),
          Container(
              color: Colors.transparent,
              width: 250.sp,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: ButtonsCustom(
                    color: colors.primary500,
                    border: colors.primary500,
                    colorText: Colors.white,
                    text: 'Aceptar',
                    radius: 50),
              ))
        ],
      ),
    );
  }
}

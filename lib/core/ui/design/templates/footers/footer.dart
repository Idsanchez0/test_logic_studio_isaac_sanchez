import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/services/services.dart';

import '../../../../network/network.dart';

class Footer extends StatefulWidget {
  const Footer({
    super.key,
  });

  @override
  State<Footer> createState() => _Footer();
}

class _Footer extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.sp, top: 10.sp),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.85),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.sp), topRight: Radius.circular(25.sp)),
      ),
      child: Table(
        children: [
          TableRow(children: [
            TableCell(
                child: GestureDetector(
                    onTap: () => services.launchPage(url: network.web),
                    child: Icon(
                      PhosphorIcons.globe(),
                      size: 30.sp,
                      color: Colors.white,
                    ))),
            TableCell(
                child: GestureDetector(
                    onTap: () => services.launchPage(url: network.linkedin),
                    child: Icon(
                      PhosphorIconsFill.linkedinLogo,
                      size: 30.sp,
                      color: Colors.white,
                    ))),
            TableCell(
                child: GestureDetector(
                    onTap: () => services.launchPage(url: network.whatsapp),
                    child: Icon(
                      PhosphorIconsFill.whatsappLogo,
                      size: 30.sp,
                      color: Colors.white,
                    ))),
          ])
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/ui/design/atoms/text/header/h1.dart';

import '../../../../network/network.dart';
import '../../../../services/services.dart';
import '../../atoms/text/body/md_p.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});
  @override
  State<MenuLateral> createState() => _MenuLateral();
}

class _MenuLateral extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => Navigator.pop(context);
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            bottom: true,
            top: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const H1(
                          title: 'Información\nAdicional',
                          color: Colors.white,
                          align: TextAlign.center),
                      SizedBox(
                        height: 30.sp,
                      ),
                      GestureDetector(
                        onTap: () => services.launchPage(url: network.web),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 8.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                PhosphorIcons.globe(),
                                size: 30.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              const MdP(
                                  title: 'Web Site',
                                  color: Colors.white,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      GestureDetector(
                        onTap: () => services.launchPage(url: network.linkedin),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 8.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                PhosphorIconsFill.linkedinLogo,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              const MdP(
                                  title: 'LinkedIn',
                                  color: Colors.white,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      GestureDetector(
                        onTap: () => services.launchPage(url: network.whatsapp),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 8.sp),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                PhosphorIconsFill.whatsappLogo,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              const MdP(
                                  title: 'LinkedIn',
                                  color: Colors.white,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        PhosphorIcons.xCircle(),
                        color: Colors.white,
                        size: 30.sp,
                      ))
                ],
              ),
            )),
      ),
    );
  }
}

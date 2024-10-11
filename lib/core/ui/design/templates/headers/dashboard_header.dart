import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/ui/utils/routes/routes.dart';

import '../../../utils/images/images.dart';

class DashboardHeader extends StatefulWidget implements PreferredSizeWidget {
  const DashboardHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(45);
  @override
  State<DashboardHeader> createState() => _DashboardHeader();
}

class _DashboardHeader extends State<DashboardHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => routes.menuLateral(context: context),
                child: Icon(
                  PhosphorIcons.list(),
                  color: Colors.white,
                  size: 35.sp,
                ),
              ),
              Container(
                width: 40.sp,
                height: 40.sp,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          images.profile,
                        ),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ));
  }
}

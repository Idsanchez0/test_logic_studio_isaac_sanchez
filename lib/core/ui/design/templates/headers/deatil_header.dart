import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/services/services.dart';
import 'package:test_isaac/core/ui/design/atoms/text/header/h1.dart';
import 'package:test_isaac/features/main_explore/presentation/controller/main_explore_controller.dart';

class DetailHeader extends StatefulWidget implements PreferredSizeWidget {
  const DetailHeader(
      {super.key, required this.title, required this.id, required this.ref});
  final String title;
  final int id;
  final WidgetRef ref;

  @override
  Size get preferredSize => const Size.fromHeight(45);
  @override
  State<DetailHeader> createState() => _DetailHeader();
}

class _DetailHeader extends State<DetailHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.ref.watch(mainExploreController.notifier);
    var state = widget.ref.watch(mainExploreController);
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
                onTap: () => Navigator.pop(context),
                child: Icon(
                  PhosphorIcons.arrowLeft(),
                  color: Colors.white,
                  size: 35.sp,
                ),
              ),
              H1(
                  title: services.firstLetterUpperCase(title: widget.title),
                  color: Colors.white,
                  align: TextAlign.center),
              GestureDetector(
                onTap: () => controller.addFavorite(widget.id),
                child: Icon(
                  state.favorite!.contains(widget.id)
                      ? PhosphorIconsFill.heart
                      : PhosphorIcons.heart(),
                  color: state.favorite!.contains(widget.id)
                      ? Colors.red
                      : Colors.white,
                  size: 35.sp,
                ),
              ),
            ],
          ),
        ));
  }
}

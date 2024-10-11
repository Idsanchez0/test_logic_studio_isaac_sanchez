import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../features/main_explore/presentation/controller/main_explore_controller.dart';
import '../../../utils/routes/routes.dart';

class OptionCard extends StatefulWidget {
  const OptionCard(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.id,
      required this.image,
      required this.ref});
  final bool isSelected;
  final String image;
  final String title;
  final String id;
  final WidgetRef ref;
  @override
  State<OptionCard> createState() => _OptionCard();
}

class _OptionCard extends State<OptionCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.ref.watch(mainExploreController.notifier);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.contain,
              opacity: .95),
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 25.sp,
                width: 25.sp,
                child: FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(.7),
                  heroTag: null,
                  onPressed: () =>
                      controller.addFavorite(int.parse(widget.id.toString())),
                  child: Icon(
                    size: 18.sp,
                    widget.isSelected
                        ? PhosphorIconsFill.heart
                        : PhosphorIcons.heart(),
                    color: widget.isSelected ? Colors.red : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 25.sp,
                width: 25.sp,
                child: FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(.7),
                  heroTag: null,
                  onPressed: () => routes.pokemonDetail(
                      id: widget.id,
                      name: widget.title,
                      image: widget.image,
                      context: context,
                      isSelected: widget.isSelected),
                  child: Icon(
                    size: 18.sp,
                    PhosphorIcons.caretRight(),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

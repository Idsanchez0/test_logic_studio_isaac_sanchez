import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/design/templates/headers/deatil_header.dart';

import '../../../../core/ui/design/templates/loader/loader.dart';
import '../../../../core/ui/design/templates/modals/middle_modal.dart';
import '../controller/detail_card_controller.dart';
import '../widgets/detail_card.dart';
import '../widgets/image_card.dart';
import '../widgets/prices_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/tabs.dart';

class DetailCardPage extends ConsumerStatefulWidget {
  const DetailCardPage({
    super.key,
    required this.id,
    required this.name,
    required this.isSelected,
    required this.image,
  });
  final bool isSelected;
  final String id;
  final String name;
  final String image;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailCardPageState();
}

class _DetailCardPageState extends ConsumerState<DetailCardPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initData());
  }

  initData() async {
    loading();
    await ref.watch(detailCardController.notifier).getDetail(id: widget.id);
    setState(() {
      Navigator.pop(context);
    });
  }

  loading() {
    middleModals.middleModal(context, const Loader(), Colors.transparent, 90);
  }

  onSelectOption(option) async {
    var controller = ref.watch(detailCardController.notifier);
    controller.selectOption(selected: option);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(detailCardController);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: DetailHeader(
        title: widget.name.toString(),
        id: int.parse(widget.id.toString()),
        ref: ref,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                      height: 250.sp,
                      child: ImageCard(
                        image: widget.image,
                      )),
                  SizedBox(
                    height: 20.sp,
                  ),
                  DetailCard(
                    ref: ref,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  Tabs(
                    onTap: (x) => onSelectOption(x),
                    ref: ref,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  if (state.option == 'stats') ...[
                    StatsCard(
                      id: widget.id,
                      ref: ref,
                      image: widget.image,
                    ),
                  ],
                  if (state.option == 'moves') ...[
                    PricesCard(id: widget.id, ref: ref)
                  ]
                ],
              )))),
    );
  }
}

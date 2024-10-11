import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/design/templates/card/error_modal_card.dart';
import 'package:test_isaac/core/ui/design/templates/headers/dashboard_header.dart';
import 'package:test_isaac/core/ui/design/templates/loader/loader.dart';
import 'package:test_isaac/core/ui/design/templates/modals/middle_modal.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';
import 'package:test_isaac/features/main_explore/presentation/controller/main_explore_controller.dart';
import 'package:test_isaac/features/main_explore/presentation/widgets/list_data_widget.dart';

import '../../../../core/ui/design/templates/footers/footer.dart';

class MainExplorePage extends ConsumerStatefulWidget {
  const MainExplorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainExplorePageState();
}

class _MainExplorePageState extends ConsumerState<MainExplorePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initData());
  }

  initData() async {
    loading();
    bool response = await ref.watch(mainExploreController.notifier).getImages();
    setState(() {
      Navigator.pop(context);
    });
    if (!response) {
      showModal();
    }
  }

  showModal() {
    middleModals.middleModal(
        context,
        const ErrorModalCard(
            message:
                'Error al realizar la consulta por favor intentalo más tarde.',
            title: 'Algo salió mal'),
        Colors.white,
        300.sp);
  }

  loading() {
    middleModals.middleModal(context, const Loader(), Colors.transparent, 90);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardHeader(),
      bottomNavigationBar: const Footer(),
      body: SafeArea(
        top: true,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
            child: ListDataWidget(initData: () => initData())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => initData(),
        backgroundColor: colors.secondary500,
        child: Icon(
          Icons.autorenew,
          size: 25.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}

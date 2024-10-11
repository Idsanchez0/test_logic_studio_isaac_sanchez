import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:test_isaac/core/ui/design/atoms/text_field/custom_drop_down_field.dart';
import 'package:test_isaac/core/ui/design/atoms/text_field/custom_search_field.dart';
import 'package:test_isaac/core/ui/design/templates/card/error_modal_card.dart';
import 'package:test_isaac/core/ui/design/templates/headers/dashboard_header.dart';
import 'package:test_isaac/core/ui/design/templates/loader/loader.dart';
import 'package:test_isaac/core/ui/design/templates/modals/middle_modal.dart';
import 'package:test_isaac/core/ui/utils/routes/routes.dart';
import 'package:test_isaac/features/main_explore/domain/list_cards.dart';
import 'package:test_isaac/features/main_explore/presentation/controller/main_explore_controller.dart';

import '../../../../core/ui/design/atoms/text/header/h1.dart';
import '../../../../core/ui/utils/colors/colors.dart';
import '../widgets/list_data_widget.dart';

class MainExplorePage extends ConsumerStatefulWidget {
  const MainExplorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainExplorePageState();
}

class _MainExplorePageState extends ConsumerState<MainExplorePage> {
  bool moreItems = false;
  String? option;
  final controllerScroll = ScrollController();
  List<ListCards> filteredList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initData());
    showMore();
  }

  onSelectOption(value) {
    setState(() {
      option = value;
    });
    ref
        .watch(mainExploreController.notifier)
        .filteredListArchetype(archetype: option.toString());
    setState(() {
      filteredList.clear();
      filteredList.addAll(ref.watch(mainExploreController).listData!);
      moreItems = false;
    });
  }

  showMore() {
    setState(() {
      moreItems = true;
    });
    controllerScroll.addListener(() {
      if (controllerScroll.position.maxScrollExtent ==
          controllerScroll.offset) {
        ref.watch(mainExploreController.notifier).loadMoreItems();
        setState(() {
          filteredList.clear();
          filteredList.addAll(ref.watch(mainExploreController).listData!);
          moreItems = false;
        });
        searchController.addListener(onSearchPokemon1);
      }
    });
  }

  initData() async {
    loading();
    bool response = await ref.watch(mainExploreController.notifier).getCards();
    setState(() {
      Navigator.pop(context);
    });
    if (!response) {
      showModal();
    } else {
      var state = ref.watch(mainExploreController);
      setState(() {
        filteredList.addAll(state.listData!);
      });
      searchController.addListener(onSearchPokemon1);
    }
  }

  void onSearchPokemon() {
    setState(() {
      moreItems = false;
    });
    var state = ref.watch(mainExploreController);
    setState(() {
      String searchText = searchController.text.toLowerCase();
      var filteredName = state.listData
          ?.where((item) => (item.name.toLowerCase().contains(searchText)))
          .toList();
      List<ListCards> result = [
        ...?filteredName,
      ];
      filteredList = result.toSet().toList();
    });
  }

  void onSearchPokemon1() {
    setState(() {
      moreItems = false;
    });

    var state = ref.watch(mainExploreController);
    setState(() {
      String searchText = searchController.text.toLowerCase();

      // Filtramos tanto por 'name' como por 'archetype'
      var filteredItems = state.listData?.where((item) {
        // Verificamos si el 'name' o el 'archetype' contienen el texto de búsqueda
        return (item.name.toLowerCase().contains(searchText) ||
            item.archetype.toString().toLowerCase().contains(searchText));
      }).toList();

      List<ListCards> result = [
        ...?filteredItems,
      ];

      // Eliminamos duplicados si los hay
      filteredList = result.toSet().toList();
    });
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
    var state = ref.watch(mainExploreController);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const DashboardHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => routes.mainExplore(context: context),
        backgroundColor: colors.primary500,
        child: Icon(
          PhosphorIcons.arrowsClockwise(),
          size: 25.sp,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                child: SingleChildScrollView(
                    controller: controllerScroll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const H1(
                            title: 'Encuentra Tu\nCarta',
                            color: Colors.white,
                            align: TextAlign.start),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(6),
                            1: FlexColumnWidth(.5),
                            2: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                  child: CustomSearchField(
                                      inputType: TextInputType.text,
                                      enable: true,
                                      hintText: 'Buscar',
                                      controller: searchController)),
                              TableCell(child: Container()),
                              TableCell(
                                  child: CustomDropdown(
                                option: option,
                                options: state.listArchetype ?? [],
                                onSelect: (x) => onSelectOption(x),
                              ))
                            ])
                          ],
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        ListDataWidget(
                          initData: initData,
                          ref: ref,
                          data: filteredList,
                        ),
                        if (moreItems) ...[
                          const SpinKitCircle(
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10.sp,
                          )
                        ]
                      ],
                    )))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

import '../../../../core/ui/design/templates/card/image_card.dart';
import '../controller/main_explore_controller.dart';

class ListDataWidget extends ConsumerStatefulWidget {
  const ListDataWidget({super.key, required this.initData});
  final Function initData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListDataWidgetState();
}

class _ListDataWidgetState extends ConsumerState<ListDataWidget> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(mainExploreController);
    var controller = ref.watch(mainExploreController.notifier);
    return LoadMoreListView.builder(
      hasMoreItem: true,
      onLoadMore: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.loadMoreItems();
      },
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        widget.initData();
      },
      loadMoreWidget: Container(
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
        ),
      ),
      itemCount: state.limit == null ? 0 : state.limit!,
      itemBuilder: (context, index) {
        return ImageCard(
            imagePath: state.listData == null ? '' : state.listData![index].url,
            title:
                '${state.listData == null ? '' : state.listData![index].title} ${index.toString()}');
      },
    );
  }
}

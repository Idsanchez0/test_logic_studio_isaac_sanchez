import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/xlg_p.dart';
import 'package:test_isaac/core/ui/utils/colors/colors.dart';

import '../controller/detail_pokemon_controller.dart';

class Tabs extends StatefulWidget {
  const Tabs({
    super.key,
    required this.onTap,
    required this.ref,
  });
  final Function onTap;
  final WidgetRef ref;
  @override
  State<Tabs> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(detailPokemonController);
    return Table(
      children: [
        TableRow(children: [
          TableCell(
              child: GestureDetector(
                  onTap: () => widget.onTap('stats'),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: state.option == 'stats'
                                    ? Colors.white
                                    : Colors.transparent))),
                    child: XlgP(
                      title: 'Stats',
                      color: state.option == 'stats'
                          ? Colors.white
                          : colors.neutral600,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                  ))),
          TableCell(
              child: GestureDetector(
                  onTap: () => widget.onTap('moves'),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: state.option == 'moves'
                                    ? Colors.white
                                    : Colors.transparent))),
                    child: XlgP(
                      title: 'Moves',
                      color: state.option == 'moves'
                          ? Colors.white
                          : colors.neutral600,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                  ))),
        ])
      ],
    );
  }
}

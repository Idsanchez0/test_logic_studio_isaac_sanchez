import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_isaac/core/ui/design/templates/menu/menu_lateral.dart';

import '../../../../features/detail_card/presentation/page/detail_card_page.dart';
import '../../../../features/main_explore/presentation/page/main_explore_page.dart';

class Routes {
  void mainExplore({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const MainExplorePage(),
            duration: const Duration(milliseconds: 200)));
  }

  void pokemonDetail(
      {required context,
      required id,
      required name,
      required isSelected,
      required image}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: DetailCardPage(
                id: id, name: name, isSelected: isSelected, image: image),
            duration: const Duration(milliseconds: 200)));
  }

  void menuLateral({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight,
            child: const MenuLateral(),
            duration: const Duration(milliseconds: 300)));
  }
}

Routes routes = Routes();

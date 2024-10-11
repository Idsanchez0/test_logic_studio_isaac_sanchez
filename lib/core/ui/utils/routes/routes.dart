import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
}

Routes routes = Routes();

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/routing/router.gr.dart';
import '../../shared/widgets/focus_escape.dart';
import '../../shared/widgets/kitapp_bottom_navigation_bar.dart';

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        animationDuration: const Duration(milliseconds: 500),
        builder: (context, child, animation) => FocusEscape(
              child: FadeTransition(opacity: animation, child: child),
            ),
        bottomNavigationBuilder: (_, tabsRouter) => KitappBottomNavigationBar(
              tabsRouter: tabsRouter,
            ),
        routes: const [
          HomeTabRouter(),
          SearchTabRouter(),
          MyProfileTabRouter()
        ]);
  }
}

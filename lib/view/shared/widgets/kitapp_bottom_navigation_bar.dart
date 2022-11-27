import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import '../../../core/init/auth_manager/auth_manager.dart';
import 'app_icons.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class KitappBottomNavigationBar extends HookConsumerWidget {
  final TabsRouter tabsRouter;

  const KitappBottomNavigationBar({required this.tabsRouter});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));
    final bottomBarIcons = [
      IconType.home,
      IconType.search,
      IconType.explore,
      IconType.user
    ];

    return SizedBox(
      height: Platform.isIOS
          ? context.dynamicHeight(0.09)
          : context.dynamicHeight(0.068),
      child: BottomAppBar(
        elevation: 10,
        child: Row(
          children: List.generate(bottomBarIcons.length, (index) {
            var isSelectedItem = tabsRouter.activeIndex == index;
            return Expanded(
              child: InkWell(
                onTap: () {
                  tabsRouter.setActiveIndex(index);
                },
                child: Center(
                  child: AppIcons(
                    iconType: bottomBarIcons[index],
                    iconColor:
                        isSelectedItem ? AppColors.black : AppColors.iconGrayed,
                    currentUser: currentUser,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
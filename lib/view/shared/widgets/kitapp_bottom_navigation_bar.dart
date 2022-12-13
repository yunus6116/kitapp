import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/context_extensions.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';
import 'app_icons.dart';

class KitappBottomNavigationBar extends HookConsumerWidget {
  final TabsRouter tabsRouter;

  const KitappBottomNavigationBar({required this.tabsRouter});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarIcons = [IconType.home, IconType.search, IconType.user];
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
      child: SizedBox(
        height: Platform.isIOS
            ? context.dynamicHeight(0.09)
            : context.dynamicHeight(0.068),
        child: BottomAppBar(
          color: AppColors.bottomBarColor,
          elevation: 10,
          child: Row(
            children: List.generate(bottomBarIcons.length, (index) {
              var isSelectedItem = tabsRouter.activeIndex == index;
              return Expanded(
                child: InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons(
                        iconType: bottomBarIcons[index],
                        iconColor: isSelectedItem
                            ? AppColors.primary
                            : AppColors.iconGrayed,
                      ),
                      const SizedBox(height: 4),
                      _buildTabText(index, isSelectedItem),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildTabText(int index, bool isSelectedItem) {
    switch (index) {
      case 0:
        return Text(
          'HOME',
          style: AppTextStyles.body7.copyWith(
              color: isSelectedItem ? AppColors.primary : AppColors.iconGrayed),
        );
      case 1:
        return Text(
          'SEARCH',
          style: AppTextStyles.body7.copyWith(
              color: isSelectedItem ? AppColors.primary : AppColors.iconGrayed),
        );
      case 2:
        return Text(
          'PROFILE',
          style: AppTextStyles.body7.copyWith(
              color: isSelectedItem ? AppColors.primary : AppColors.iconGrayed),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

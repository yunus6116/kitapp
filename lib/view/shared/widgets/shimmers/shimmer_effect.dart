import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/init/theme_manager/theme_manager.dart';

class ShimmerEffect extends HookConsumerWidget{
  final Widget child;
  final bool enabled;

  const ShimmerEffect({required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Shimmer.fromColors(
      baseColor: theme.neutral[300]!,
      highlightColor: theme.neutral[400]!,
      enabled: enabled,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../styles/colors.dart';

class BaseAsyncProvider<T> extends HookConsumerWidget {
  final AsyncValue<T> value;
  final Widget Function(T) builder;
  const BaseAsyncProvider(
      {required this.value, required this.builder, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
        data: builder,
        error: (error, __) {
          debugPrint(error.toString());
          return const SizedBox.shrink();
        },
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ));
  }
}

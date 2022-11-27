import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/init/theme_manager/theme_manager.dart';
import '../../styles/text_styles.dart';

class CustomRadioListTile<T> extends HookConsumerWidget {
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final String? title;

  const CustomRadioListTile({
    required this.value,
    this.groupValue,
    this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Row(
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: theme.contrastColor),
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: theme.contrastColor,
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
            onTap: () => onChanged!(value),
            child: Text(
              title ?? "",
              style: AppTextStyles.body1,
            ))
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../styles/colors.dart';
import '../custom_button.dart';
import 'base_dialog.dart';

class DeletePictureDialog extends HookConsumerWidget {
  final VoidCallback onDeleteClick;

  const DeletePictureDialog({required this.onDeleteClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.delete_outline_outlined,
          size: 35,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Resim silinecek.",
          style: context.textTheme.headline4
              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 15,
        ),
        Text("Silmek istiyor musunuz?.", style: context.textTheme.bodyText2),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              height: 30,
              buttonText: "HAYIR",
              textColor: AppColors.dustyGray400,
              backgroundColor: Colors.transparent,
              onPressed: () => context.popRoute(),
            ),
            const SizedBox(
              width: 20,
            ),
            CustomButton(
              height: 30,
              buttonText: "EVET",
              backgroundColor: context.theme.primaryColor,
              onPressed: () {
                onDeleteClick();
                context.popRoute();
              },
            )
          ],
        )
      ],
    ));
  }
}

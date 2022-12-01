import 'package:auto_route/auto_route.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../styles/colors.dart';
import 'base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../custom_button.dart';

class DeleteAccountDialog extends HookConsumerWidget {
  final VoidCallback onDeleteClick;

  const DeleteAccountDialog({required this.onDeleteClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.warning,
          size: 35,
          color: Colors.red,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "HESABINIZ SİLİNECEK!",
          style: context.textTheme.headline4
              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 15,
        ),
        Text("Kalıcı olarak hesabınıza ulaşamayacaksınız!",
            style: context.textTheme.bodyText1),
        const SizedBox(
          height: 15,
        ),
        Text("Silmek istiyor musunuz?", style: context.textTheme.bodyText2),
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

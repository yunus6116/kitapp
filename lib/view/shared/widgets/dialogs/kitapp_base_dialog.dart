import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../custom_button.dart';
import 'base_dialog.dart';

class KitappBaseDialog extends HookConsumerWidget {
  final Widget? icon;
  final String? heading, text;
  final VoidCallback? onSubmit;
  final String? leftButtonText, rightButtonText, centerButtonText;

  const KitappBaseDialog(
      {this.icon,
      this.heading,
      this.text,
      this.onSubmit,
      this.leftButtonText,
      this.rightButtonText,
      this.centerButtonText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    buildIcon() {
      return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: icon,
      );
    }

    buildHeading() {
      return Text(
        heading ?? "",
        style: AppTextStyles.heading1,
        textAlign: TextAlign.center,
      );
    }

    buildText() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 15,
        ),
        child: Text(
          text ?? "",
          style: AppTextStyles.body1,
          textAlign: TextAlign.center,
        ),
      );
    }

    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) buildIcon(),
          if (heading != null) buildHeading(),
          if (text != null) buildText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (centerButtonText != null)
                CustomButton(
                  height: 32,
                  buttonText: centerButtonText!,
                  backgroundColor: context.theme.primaryColor,
                  onPressed: onSubmit ?? () => context.popRoute(true),
                ),
              if (leftButtonText != null)
                Expanded(
                  child: CustomButton(
                    height: 32,
                    buttonText: leftButtonText!,
                    textColor: AppColors.dustyGray500,
                    backgroundColor: Colors.transparent,
                    onPressed: () => context.popRoute(false),
                  ),
                ),
              if (rightButtonText != null)
                Expanded(
                  child: CustomButton(
                    height: 32,
                    buttonText: rightButtonText!,
                    backgroundColor: context.theme.primaryColor,
                    onPressed: onSubmit ?? () => context.popRoute(true),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}

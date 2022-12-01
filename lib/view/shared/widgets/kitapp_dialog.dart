import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';
import 'custom_button.dart';

import 'button/tertiary_button.dart';

class KitappDialog {
  static show(
    BuildContext context, {
    String? text,
    String? heading,
    Widget? icon,
    String? primaryButtonText,
    String? tertiaryButtonText,
    bool preventClose = false,
    Function? onPressed,
  }) async {
    return await showDialog(
        barrierDismissible: !preventClose,
        context: context,
        builder: (BuildContext context) {
          return _buildDialog(
            context,
            text: text,
            heading: heading,
            icon: icon,
            primaryButtonText: primaryButtonText,
            tertiaryButtonText: tertiaryButtonText,
            preventClose: preventClose,
            onPressed: onPressed,
          );
        });
  }

  static _buildDialog(
    BuildContext context, {
    String? text,
    String? heading,
    Widget? icon,
    String? primaryButtonText,
    String? tertiaryButtonText,
    bool preventClose = false,
    Function? onPressed,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.screenAwareSize(10))),
      child: Container(
        padding: EdgeInsets.only(
          top: context.screenAwareSize(20),
          right: context.screenAwareSize(25),
          bottom: context.screenAwareSize(15),
          left: context.screenAwareSize(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon != null ? _buildIcon(context, icon) : const SizedBox(),
            heading != null
                ? _buildHeading(context, heading)
                : const SizedBox(),
            text != null ? _buildText(context, text) : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTertiaryButton(context, tertiaryButtonText),
                preventClose && primaryButtonText == null
                    ? Container()
                    : _buildPrimaryButton(
                        context,
                        primaryButtonText,
                        onPressed,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static _buildIcon(BuildContext context, Widget icon) {
    return Container(
      padding: EdgeInsets.only(bottom: context.screenAwareSize(10)),
      child: icon,
    );
  }

  static _buildHeading(BuildContext context, String heading) {
    return Text(
      heading,
      style: AppTextStyles.heading6.copyWith(color: AppColors.primary),
      textAlign: TextAlign.center,
    );
  }

  static _buildText(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenAwareSize(10),
        bottom: context.screenAwareSize(15),
      ),
      child: Text(
        text,
        style: AppTextStyles.body6.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  static _buildTertiaryButton(
      BuildContext context, String? tertiaryButtonText) {
    return tertiaryButtonText != null
        ? TertiaryButton(
            height: context.screenAwareSize(38),
            onPressed: () {
              Navigator.pop(context, false);
            },
            text: tertiaryButtonText,
          )
        : const SizedBox();
  }

  static _buildPrimaryButton(
      BuildContext context, String? tertiaryButtonText, Function? onPressed) {
    return CustomButton(
      height: context.screenAwareSize(38),
      onPressed: onPressed ??
          () {
            Navigator.pop(context, true);
          },
      buttonText: tertiaryButtonText ?? 'OK',
      backgroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 90),
    );
  }
}

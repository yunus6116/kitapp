import '../../../../core/extensions/context_extensions.dart';

import '../../styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TertiaryButton extends HookWidget {
  final VoidCallback onPressed;
  final String? text;
  final double? height, margin;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final Color? color;

  const TertiaryButton({
    required this.onPressed,
    this.text,
    this.height,
    this.margin = 4.0,
    this.textStyle,
    this.child,
    this.padding,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: context.dynamicHeight(margin!)),
      height: context.dynamicHeight(height ?? 48),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: padding ??
              EdgeInsets.symmetric(horizontal: context.dynamicHeight(10)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              text ?? '',
              style: textStyle ?? AppTextStyles.tertiaryButtonText(context),
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
      ),
    );
  }
}

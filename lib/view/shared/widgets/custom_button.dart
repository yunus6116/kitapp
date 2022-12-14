import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/init/theme_manager/theme_manager.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class CustomButton extends HookConsumerWidget {
  final String buttonText;
  final bool isDisabled, showShadow;
  final Function? onPressed;
  final bool? isLoading;
  final bool showBorder;
  final double? borderRadius, height, width;
  final Color? backgroundColor, textColor, borderColor;
  final EdgeInsets? margin, padding;
  final Widget? icon, suffixIcon;
  final TextStyle? buttonTextStyle;
  final Color? progressIndicatorColor;
  final TextAlign? textAlign;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
    this.isDisabled = false,
    this.showShadow = false,
    this.isLoading,
    this.borderRadius = 6,
    this.width,
    this.height = 48,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.margin,
    this.padding,
    this.icon,
    this.suffixIcon,
    this.showBorder = false,
    this.buttonTextStyle,
    this.progressIndicatorColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final buttonTextColor = textColor ?? theme.scaffoldBackground;
    final isButtonLoading = useState(false);
    final mounted = useIsMounted();

    void toggleButtonLoading() {
      if (isLoading == null) {
        isButtonLoading.value = !isButtonLoading.value;
      }
    }

    return InkWell(
      onTap: (isDisabled || (isLoading ?? isButtonLoading.value))
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();
              toggleButtonLoading();
              onPressed != null ? await onPressed!() : null;
              if (mounted()) {
                toggleButtonLoading();
              }
            },
      child: AnimatedContainer(
        duration: theme.normalDuration,
        width: width,
        margin: margin ?? EdgeInsets.zero,
        height: height!,
        padding: padding ??
            (width == null
                ? const EdgeInsets.symmetric(horizontal: 10)
                : EdgeInsets.zero),
        decoration: BoxDecoration(
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                    color: Color.fromRGBO(149, 149, 149, .25),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  )
                ]
              : null,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: showBorder
              ? Border.all(color: borderColor ?? theme.primary.shade600)
              : null,
          color: isDisabled
              ? (backgroundColor != null &&
                      backgroundColor != Colors.transparent
                  ? AppColors.disabledBgColor
                  : Colors.transparent)
              : (backgroundColor ?? theme.primary[600]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: isLoading ?? isButtonLoading.value
              ? [
                  CircularProgressIndicator(
                      color: progressIndicatorColor ?? theme.scaffoldBackground)
                ]
              : [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: icon!,
                    ),
                  Flexible(
                    child: Text(
                      buttonText,
                      style: buttonTextStyle ??
                          AppTextStyles.textButton1.copyWith(
                              color:
                                  isDisabled ? Colors.white : buttonTextColor),
                      textAlign: textAlign?? TextAlign.center,
                    ),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: suffixIcon!,
                    ),
                ],
        ),
      ),
    );
  }
}

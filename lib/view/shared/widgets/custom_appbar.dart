import 'package:flutter/material.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final bool? hasTitle, showBackButton;
  final String? title;
  final IconData? iconData;
  final VoidCallback? onIconPressed;
  final Widget? leadingIcon;
  final double? elevation;
  final Widget? dropdownMenu;

  CustomAppbar({
    this.onIconPressed,
    this.hasTitle = false,
    this.title,
    this.showBackButton = true,
    this.iconData,
    this.leadingIcon,
    this.elevation,
    this.dropdownMenu,
  });

  Widget _buildTitleText(BuildContext context) => Text(
        title ?? "",
        style: context.textTheme.headline6!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: context.theme.primaryColorDark),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitleText(context),
      centerTitle: false,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: showBackButton!,
      leading: leadingIcon,
      iconTheme: context.theme.iconTheme.copyWith(color: Colors.black),
      elevation: elevation ?? 0,
      actions: [
        dropdownMenu ?? const SizedBox(),
        if (onIconPressed != null)
          iconData != null
              ? IconButton(
                  onPressed: onIconPressed,
                  splashColor: Colors.transparent,
                  splashRadius: 0.1,
                  icon: Icon(
                    iconData,
                    color: Colors.black87,
                    size: 20,
                  ))
              : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/shared/widgets/user_avatar.dart';

import '../../../core/global_models/public_user/public_user_model.dart';

enum IconType { home, search, explore, user }

class AppIcons extends HookConsumerWidget {
  final IconType iconType;
  final Color iconColor;
  final double? width;
  final PublicUser? currentUser;
  final bool hasNewMessage;
  final bool hasNewNotification;

  const AppIcons({
    required this.iconType,
    this.iconColor = Colors.white,
    this.width,
    this.currentUser,
    this.hasNewMessage = false,
    this.hasNewNotification = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget _buildIcon(IconData iconData) {
      return Icon(iconData, color: iconColor, size: width);
    }

    Widget _buildSvg(String svgName) =>
        SvgPicture.asset("assets/svg/$svgName.svg",
            width: width, color: iconColor);

    Widget _buildProfileImg(String pngName) =>
        currentUser?.profilePicture != null
            ? UserAvatar(
                imageUrl: currentUser?.profilePicture,
                radius: 16,
              )
            : Image.asset(
                "assets/png/$pngName.png",
                width: width ?? 32,
              );

    switch (iconType) {
      case IconType.home:
        return _buildIcon(Icons.home);
      case IconType.search:
        return _buildIcon(Icons.search);
      case IconType.explore:
        return _buildIcon(Icons.explore);
      case IconType.user:
        return _buildProfileImg(IconType.user.name);
      default:
        return _buildSvg('');
    }
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/view/shared/widgets/storage_image.dart';

import '../../../core/init/auth_manager/auth_manager.dart';
import 'shimmers/shimmer_effect.dart';

class UserAvatar extends HookConsumerWidget {
  final String? imageUrl;
  final double radius;

  const UserAvatar({this.imageUrl, this.radius = 30});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));
    bool? isStoragePhoto =
        imageUrl != null ? imageUrl!.contains('${currentUser!.uid}') : null;
    Widget _buildLoadingWidget() => AspectRatio(
          aspectRatio: 2.1,
          child: ShimmerEffect(
              child: Center(
            child: Container(
              color: Colors.white,
              width: context.dynamicWidth(0.9),
            ),
          )),
        );
    return Stack(
      children: [
        if (imageUrl != null)
          ShimmerEffect(
              child: CircleAvatar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            radius: radius,
          )),
        isStoragePhoto == null
            ? ClipOval(
                child: SizedBox.fromSize(
                    size: Size.fromRadius(radius),
                    child: Icon(
                      Feather.user,
                      color: context.theme.primaryColorDark,
                      size: radius + 4,
                    )),
              )
            : isStoragePhoto
                ? ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(radius),
                      child: StorageImage(
                        imagePath: imageUrl!,
                        placeholder: _buildLoadingWidget(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: radius,
                    backgroundImage: imageUrl == null
                        ? null
                        : CachedNetworkImageProvider(imageUrl!),
                  ),
      ],
    );
  }
}

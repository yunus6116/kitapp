import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/global_providers/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StorageImage extends HookConsumerWidget {
  final String imagePath;
  final Widget placeholder;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Widget Function(String imageLink)? imageBuilder;

  const StorageImage(
      {required this.imagePath,
      required this.placeholder,
      this.height,
      this.width,
      this.imageBuilder,
      this.fit,
      this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageLinkProvider = ref.watch(imageLinkFutureProvider(imagePath));

    return imageLinkProvider.when(
      error: (_, __) => placeholder,
      loading: () => placeholder,
      data: imageBuilder ??
          (String data) => CachedNetworkImage(
                imageUrl: data,
                placeholder: (_, __) => placeholder,
                fit: fit ?? BoxFit.cover,
                height: height,
                width: width,
                color: color,
              ),
    );
  }
}

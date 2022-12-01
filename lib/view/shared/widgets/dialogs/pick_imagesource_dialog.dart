import 'package:auto_route/auto_route.dart';
import '../../../../core/extensions/context_extensions.dart';
import 'base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../styles/colors.dart';

class PickImageSourceDialog extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget _buildIconAndText(
        String title, IconData iconData, ImageSource imageSource) {
      return GestureDetector(
        onTap: () => context.popRoute(imageSource),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: Colors.black87,
              size: 35,
            ),
            Text(title, style: context.textTheme.bodyText2),
          ],
        ),
      );
    }

    return BaseDialog(
        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: _buildIconAndText(
                        "Kamera", Icons.camera_alt, ImageSource.camera),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: _buildIconAndText(
                        "Galeri", Icons.photo_library, ImageSource.gallery),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () => context.popRoute(),
                child: Text(
                  "İPTAL",
                  style: context.textTheme.caption
                      ?.copyWith(color: AppColors.dustyGray600),
                ))
          ],
        ));
  }
}

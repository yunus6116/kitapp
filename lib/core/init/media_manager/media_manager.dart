import 'package:flutter/services.dart';

import '../../../view/shared/widgets/dialogs/pick_imagesource_dialog.dart';
import '../../global_constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../extensions/snackbar_extension.dart';

class MediaManager {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>?> pickImageWithDialog(BuildContext context,
      {bool allowMultiPick = false}) async {
    final imageSource = await showImageSourceDialog(context);
    if (imageSource == null) {
      return null;
    }
    List<XFile>? images = await pickImage(
        imageSource: imageSource, pickMultiImage: allowMultiPick);
    if (images == null) {
      return null;
    }
    return images;
  }

  Future<ImageSource?> showImageSourceDialog(BuildContext context) async {
    ImageSource? selectedImageSource = await showDialog(
        context: context, builder: (_) => PickImageSourceDialog());
    return selectedImageSource;
  }

  Future<List<XFile>?> pickImage(
      {bool pickMultiImage = true,
      ImageSource? imageSource = ImageSource.gallery}) async {
    List<XFile>? imagesList;
    try {
      if (pickMultiImage) {
        imagesList = await _picker.pickMultiImage(imageQuality: 50);
      } else {
        var image =
            await _picker.pickImage(source: imageSource!, imageQuality: 50);
        if (image != null) {
          imagesList = [image];
        }
      }
      return imagesList;
    } on PlatformException catch (e) {
      if (e.code == "camera_access_denied") {
        return snackBarKey.showSnackBar(
          message: 'Lütfen ayarlardan galeriye erişmeye izin verin',
          duration: const Duration(seconds: 4),
        );
      } else if (e.code == "photo_access_denied") {
        return snackBarKey.showSnackBar(
          message: 'Lütfen ayarlardan kameraya erişmeye izin verin',
          duration: const Duration(seconds: 4),
        );
      } else {
        return snackBarKey.showSnackBar(message: e.toString());
      }
    }
  }

  Future<Uint8List> convertXFileToImage(XFile xFile) async {
    return await xFile.readAsBytes();
  }
}

final mediaManagerProvider = Provider((_) => MediaManager());

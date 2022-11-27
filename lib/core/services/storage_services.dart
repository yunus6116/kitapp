import 'dart:typed_data';

import 'package:kitapp/core/extensions/snackbar_extension.dart';

import '../global_providers/global_providers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../global_constants/global_constants.dart';

abstract class IStorageServices {
  Future<String> getPictureUrl(String path);
  Future<String> uploadImage(String storagePath, Uint8List image);
  Future<void> deleteImage(String storagePath);
  Future<String> uploadProfileImage(String storagePath, Uint8List image);
}

class StorageServices extends IStorageServices {
  late FirebaseStorage _firebaseStorage;
  final Ref ref;

  StorageServices(this.ref) {
    _firebaseStorage = ref.read(firebaseStorageProvider);
  }

  @override
  Future<String> getPictureUrl(String path) async {
    return await _firebaseStorage.ref(path).getDownloadURL();
  }

  @override
  Future<String> uploadImage(String storagePath, Uint8List image) async {
    try {
      Reference storageReference = _firebaseStorage.ref().child(storagePath);
      var imagePath = storageReference
          .putData(image,
              SettableMetadata(customMetadata: {"contentType": 'image/jpg'}))
          .snapshot
          .ref
          .fullPath;
      imagePath = imagePath[0] != '/' ? '/$imagePath' : imagePath;

      return imagePath;
    } catch (e) {
      snackBarKey.showSnackBar(message: e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteImage(String storagePath) async {
    try {
      Reference storageReference;
      storageReference = _firebaseStorage.ref().child(storagePath);
      await storageReference.delete();
    } catch (e) {
      snackBarKey.showSnackBar(message: e.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadProfileImage(String storagePath, Uint8List image) async {
    try {
      Reference storageReference;

      storageReference = _firebaseStorage.ref().child(storagePath);
      TaskSnapshot imagePathSnapshot = await storageReference.putData(image,
          SettableMetadata(customMetadata: {"contentType": 'image/jpg'}));
      String fullPath = imagePathSnapshot.storage.ref().fullPath;
      String imagePath = fullPath[0] != '/' ? '/$fullPath' : fullPath;

      return imagePath;
    } catch (e) {
      snackBarKey.showSnackBar(message: e.toString());
      rethrow;
    }
  }
}

final storageServicesProvider = Provider((ref) => StorageServices(ref));

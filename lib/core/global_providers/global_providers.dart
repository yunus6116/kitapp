import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../services/storage_services.dart';

///We override global providers value in main.dart/ProviderScope
final fireStoreProvider = Provider<FirebaseFirestore>((ref) {
  throw UnimplementedError();
});

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  throw UnimplementedError();
});

final authProvider = Provider<FirebaseAuth>((ref) {
  throw UnimplementedError();
});

final imageLinkFutureProvider =
    FutureProvider.family<String, String>((ref, path) async {
  return await ref.read(storageServicesProvider).getPictureUrl(path);
});
final packageInfoFutureProvider = FutureProvider<PackageInfo>((ref) async {
  return await PackageInfo.fromPlatform();
});

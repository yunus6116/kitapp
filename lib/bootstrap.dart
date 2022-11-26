import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/global_providers/global_providers.dart';
import 'firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  final _appRouter = AppRouter();
  final _fireStoreInstance = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('tr')],
      fallbackLocale: const Locale('en', 'tr'),
      child: ProviderScope(overrides: [
        routerProvider.overrideWithValue(_appRouter),
        fireStoreProvider.overrideWithValue(_fireStoreInstance),
        firebaseStorageProvider.overrideWithValue(_firebaseStorage),
        authProvider.overrideWithValue(_auth),
      ], child: await builder()),
    ),
  );
}

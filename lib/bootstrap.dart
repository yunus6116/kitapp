import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/global_providers/global_providers.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/routing/router.gr.dart';
import 'core/routing/router_provider.dart';
import 'firebase_options.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  openHiveBoxes() async {
    await Hive.openBox(BoxType.generalBox.name);
  }

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await openHiveBoxes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  final appRouter = AppRouter();
  final fireStoreInstance = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('tr')],
      fallbackLocale: const Locale('en', 'tr'),
      child: ProviderScope(overrides: [
        routerProvider.overrideWithValue(appRouter),
        fireStoreProvider.overrideWithValue(fireStoreInstance),
        firebaseStorageProvider.overrideWithValue(firebaseStorage),
        authProvider.overrideWithValue(auth),
      ], child: await builder()),
    ),
  );
}

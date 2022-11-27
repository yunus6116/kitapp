import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';

import '../../../../core/init/auth_manager/auth_manager.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../../../../core/routing/router.gr.dart';
import '../../../../core/routing/router_provider.dart';

class SplashVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  SplashVM(this.ref) {
    router = ref.read(routerProvider);
  }

  Future<void> navigateUserAfterSplashDone(BuildContext context) async {
    Future.delayed(const Duration(seconds: 4), () {
      bool? seenOnboarding = ref
          .read(cacheManagerProvider)
          .readFromBox<bool>(BoxKey.seenOnboardingPages);
      ref.read(authManagerProvider).currentUserModel?.uid != null &&
              ref
                  .read(authManagerProvider)
                  .currentUserModel!
                  .verifyStatus!
                  .isEmailVerified
          ? router.replace(const MainRoute())
          : seenOnboarding ?? false
              ? router.replace(const MainRoute())
              : router.replace(const OnboardingRoute());
    });
  }
}

final splashVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => SplashVM(ref));

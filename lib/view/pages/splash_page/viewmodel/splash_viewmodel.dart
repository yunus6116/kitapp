import 'dart:async';

import 'package:flutter/material.dart';
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

  void navigateUserAfterSplashDone(BuildContext context) {
    Timer(2.seconds, () {
      ref.read(authManagerProvider).currentUserModel?.uid != null &&
              ref
                  .read(authManagerProvider)
                  .currentUserModel!
                  .verifyStatus!
                  .isEmailVerified
          ? router.replace(const MainRoute())
          : router.replace(const OnboardingRoute());
    });
  }
}

final splashVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => SplashVM(ref));

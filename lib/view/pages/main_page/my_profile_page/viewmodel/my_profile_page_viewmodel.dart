import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/snackbar_extension.dart';
import '../../../../../core/global_constants/global_constants.dart';
import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';
import '../../../../../core/services/registration_services.dart';

final myProfileVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => MyProfileVM(ref));

class MyProfileVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  MyProfileVM(this.ref) {
    router = ref.read(routerProvider);
  }

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> logout() async {
    try {
      await ref.read(registrationServicesProvider).signOut();
      await router.pushAndPopUntil(SignInRoute(), predicate: (_) => false);
    } on FirebaseAuthException catch (e) {
      return snackBarKey.showSnackBar(
        message: e.message,
      );
    }
  }
}

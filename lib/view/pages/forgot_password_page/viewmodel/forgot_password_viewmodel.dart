// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/snackbar_extension.dart';
import '../../../../core/global_constants/global_constants.dart';
import '../../../../core/routing/router.gr.dart';
import '../../../../core/routing/router_provider.dart';
import '../../../../core/services/registration_services.dart';
import '../../../shared/widgets/kitapp_dialog.dart';
import '../constants/forgot_password_constants.dart';

final forgotPasswordVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => ForgotPasswordVM(ref));

class ForgotPasswordVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  ForgotPasswordVM(this.ref) {
    router = ref.read(routerProvider);
  }

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendResetPassword(BuildContext context) async {
    try {
      await ref
          .read(registrationServicesProvider)
          .resetPassword(eMail: emailController.text);
      await KitappDialog.show(
        context,
        icon: Image.asset(
          'assets/png/forgot_password.png',
          fit: BoxFit.cover,
          height: 50,
          width: 50,
        ),
        heading: ForgotPasswordConstants.chiaraDialogHeading,
        text: ForgotPasswordConstants.chiaraDialogText,
        primaryButtonText: 'Got it!',
        onPressed: () async {
          await router.replaceAll(
            [const WelcomeRoute(), SignInRoute()],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      return snackBarKey.showSnackBar(
          message: e.message, duration: const Duration(seconds: 5));
    }
  }
}

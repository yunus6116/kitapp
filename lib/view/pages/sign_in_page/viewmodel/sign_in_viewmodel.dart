import 'package:kitapp/core/extensions/snackbar_extension.dart';
import 'package:kitapp/core/global_constants/global_constants.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/init/auth_manager/auth_manager.dart';
import '../../../shared/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/routing/router.gr.dart';
import '../../../../core/routing/router_provider.dart';
import '../../../../core/services/registration_services.dart';
import '../../../shared/enums/sign_in_type.dart';
import '../../../shared/widgets/button/tertiary_button.dart';
import '../../../shared/widgets/custom_snackbar.dart';
import '../constants/sign_in_constants.dart';
import '../model/sign_in_model.dart';

final signInVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => SignInVM(ref));

class SignInVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  SignInVM(this.ref) {
    router = ref.read(routerProvider);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInModel = SignInModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Future<void> navigateToSignUpPage() async {
  //   await router.navigate(const SignUpRoute());
  // }

  Future<void> signIn(BuildContext context, SignInType signInType) async {
    try {
      switch (signInType) {
        case SignInType.mailSignIn:
          try {
            await ref.read(registrationServicesProvider).signOut();
            UserCredential? userCredential = await ref
                .read(registrationServicesProvider)
                .signInWithMail(
                    emailController.text.trim(), passwordController.text);
            await router.pushAndPopUntil(const MainRoute(),
                predicate: (_) => false);
            // if (ref
            //     .read(authManagerProvider)
            //     .currentOnlineUser!
            //     .emailVerified) {
            //   await ref
            //       .read(registrationServicesProvider)
            //       .updateUserIsEmailVerifiedIntoFireStore(
            //           userCredential: userCredential);
            //   await router.pushAndPopUntil(const MainRoute(),
            //       predicate: (_) => false);
            // } else {
            //   snackBarKey.showSnackBar(
            //       duration: const Duration(seconds: 10),
            //       content: await _buildSendEmailVerificationSnackContent());
            // }
          } on FirebaseAuthException catch (_) {
            return snackBarKey.showSnackBar(
                message: SignInConstants.tryAgainToSignIn);
          }
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      snackBarKey.showSnackBar(message: e.message, error: SnackBarType.error);
    }
  }

  Future<Row> _buildSendEmailVerificationSnackContent() async {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          SignInConstants.verifyEmailText,
          style: TextStyle(color: Colors.white),
        ),
        TertiaryButton(
            color: Colors.white,
            onPressed: () async {
              await ref
                  .read(registrationServicesProvider)
                  .sendEmailVerification(
                      user: ref.read(authManagerProvider).currentOnlineUser!)
                  .then((value) async {
                snackBarKey.showSnackBar(
                    message: SignInConstants.emailResentText,
                    duration: const Duration(seconds: 3));
                await signOut();
              });
            },
            text: SignInConstants.sendAgainText,
            textStyle: const TextStyle(color: AppColors.primary),
            height: 25),
      ],
    );
  }

  Future<void> signOut() async {
    try {
      await ref.read(registrationServicesProvider).signOut();
      router.replace(SignInRoute());
    } on FirebaseAuthException catch (e) {
      snackBarKey.showSnackBar(message: e.message);
    }
  }
}

import '../../../../core/extensions/snackbar_extension.dart';
import '../../../../core/global_constants/global_constants.dart';
import '../../../../core/global_models/public_user/public_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/init/auth_manager/auth_manager.dart';
import '../../../../core/routing/router.gr.dart';
import '../../../../core/routing/router_provider.dart';
import '../../../../core/services/registration_services.dart';
import '../../../shared/widgets/custom_snackbar.dart';
import '../../../shared/widgets/kitapp_dialog.dart';
import '../constants/sign_up_constants.dart';

final signUpVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => SignUpVM(ref));

class SignUpVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;
  final PublicUser publicUser = PublicUser();

  SignUpVM(this.ref) {
    router = ref.read(routerProvider);
  }

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void setPublicUserFirstName(String? name) {
    publicUser.firstName = name;
  }

  void setPublicUserLastname(String? lastName) {
    publicUser.lastName = lastName;
  }

  void setPublicUserEmail(String? eMail) {
    publicUser.email = eMail;
  }

  void setPublicUserIsAgreedTerms(bool? isAgreedTerms) {
    publicUser.isAgreedTerms = isAgreedTerms;
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        String name = nameController.text;
        String lastName = lastNameController.text;
        String mail = emailController.text;
        String password = passwordController.text;

        await ref
            .read(registrationServicesProvider)
            .creatUserWithEmailAndPassword(
              name: name.trim(),
              lastName: lastName.trim(),
              mail: mail.trim(),
              password: password,
            );
        User currentOnlineUser =
            ref.read(authManagerProvider).currentOnlineUser!;
        await ref
            .read(registrationServicesProvider)
            .sendEmailVerification(user: currentOnlineUser);
        // ignore: use_build_context_synchronously
        await KitappDialog.show(
          context,
          icon: const Text(
            '🖖🏼',
            style: TextStyle(fontSize: 48),
          ),
          heading: SignUpConstants.chiaraDialogHeading2,
          text: SignUpConstants.chiaraDialogText2,
          primaryButtonText: 'Got it!',
          onPressed: () async {
            await router.replaceAll(
              [const WelcomeRoute(), SignInRoute()],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Navigator.pop(context, false);
        snackBarKey.showSnackBar(
            message: SignUpConstants.emailAlreadyInUseText,
            error: SnackBarType.error,
            duration: const Duration(seconds: 3));
      }
    }
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

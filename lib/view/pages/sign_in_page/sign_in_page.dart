import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import 'package:kitapp/view/pages/sign_in_page/viewmodel/sign_in_viewmodel.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';
import 'package:kitapp/view/shared/widgets/custom_button.dart';

import '../../shared/enums/sign_in_type.dart';
import '../../shared/widgets/controlled_textfield.dart';
import '../../../core/extensions/string_extensions.dart';
import 'constants/sign_in_constants.dart';

class SignInPage extends HookConsumerWidget {
  SignInPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController =
        ref.watch(signInVMProvider.select((value) => value.emailController));
    final passwordController =
        ref.watch(signInVMProvider.select((value) => value.passwordController));
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Login',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                      ),
                    ),
                    const SizedBox(height: 5),
                    ControlledTextField(
                      textEditingController: emailController,
                      prefixIcon: Icon(
                        FontAwesome5Solid.user_alt,
                        color: context.theme.secondaryHeaderColor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      textInputType: TextInputType.emailAddress,
                      validate: (value) {
                        if (value == "") {
                          return value?.hasData(fieldName: "Email address");
                        }
                        return value?.isValidMail(errorMessage: null);
                      },
                    ),
                    const SizedBox(height: 12),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                      ),
                    ),
                    const SizedBox(height: 5),
                    ControlledTextField(
                      obscureText: true,
                      textEditingController: passwordController,
                      prefixIcon: Icon(
                        MaterialCommunityIcons.lock,
                        color: context.theme.secondaryHeaderColor,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      validate: (value) {
                        if (value == "") {
                          return value?.hasData(fieldName: "Parola");
                        }
                        return value?.hasMinLengthOf(6);
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      buttonText: 'Let me in',
                      backgroundColor: AppColors.primary,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 55,
                      borderRadius: 11,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await ref.read(signInVMProvider).signIn(
                                context,
                                SignInType.mailSignIn,
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Forget my password, need help! 😰',
                      style: AppTextStyles.forgotPassword,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

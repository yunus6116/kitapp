import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'viewmodel/forgot_password_viewmodel.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/custom_button.dart';

import '../../shared/widgets/controlled_textfield.dart';
import '../../../core/extensions/string_extensions.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  ForgotPasswordPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(
        forgotPasswordVMProvider.select((value) => value.emailController));

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Forgot Password',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
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
                              Icons.email,
                              color: context.theme.secondaryHeaderColor,
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            textInputType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value == "") {
                                return value?.hasData(
                                    fieldName: "Email address");
                              }
                              return value?.isValidMail(errorMessage: null);
                            },
                          ),
                          const SizedBox(height: 32),
                          CustomButton(
                            buttonText: 'Send',
                            backgroundColor: AppColors.primary,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 55,
                            borderRadius: 11,
                            isLoading: false,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await ref
                                    .read(forgotPasswordVMProvider)
                                    .sendResetPassword(context);
                              }
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/view/pages/sign_up_page/viewmodel/sign_up_viewmodel.dart';

import '../../../core/routing/router.gr.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/controlled_textfield.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../shared/widgets/custom_button.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController =
        ref.watch(signUpVMProvider.select((value) => value.nameController));
    final lastNameController =
        ref.watch(signUpVMProvider.select((value) => value.lastNameController));
    final emailController =
        ref.watch(signUpVMProvider.select((value) => value.emailController));
    final passwordController =
        ref.watch(signUpVMProvider.select((value) => value.passwordController));
    final formKey =
        ref.watch(signUpVMProvider.select((value) => value.formKey));

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Sign Up',
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
                              'Name',
                            ),
                          ),
                          const SizedBox(height: 5),
                          ControlledTextField(
                            textEditingController: nameController,
                            prefixIcon: Icon(
                              FontAwesome5Solid.user_alt,
                              color: context.theme.secondaryHeaderColor,
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            textInputType: TextInputType.emailAddress,
                            onChange: (_) => ref
                                .read(signUpVMProvider)
                                .setPublicUserFirstName(
                                    nameController.text.isEmpty
                                        ? null
                                        : nameController.text.trim()),
                            validate: (value) {
                              if (value == "") {
                                return value?.hasData(fieldName: "Name");
                              }
                              return value?.hasMinLengthOf(2);
                            },
                          ),
                          const SizedBox(height: 12),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Last Name',
                            ),
                          ),
                          const SizedBox(height: 5),
                          ControlledTextField(
                            textEditingController: lastNameController,
                            prefixIcon: Icon(
                              FontAwesome5Solid.user_alt,
                              color: context.theme.secondaryHeaderColor,
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            textInputType: TextInputType.emailAddress,
                            onChange: (_) => ref
                                .read(signUpVMProvider)
                                .setPublicUserLastname(
                                    nameController.text.isEmpty
                                        ? null
                                        : nameController.text.trim()),
                            validate: (value) {
                              if (value == "") {
                                return value?.hasData(fieldName: "Last Name");
                              }
                              return value?.hasMinLengthOf(2);
                            },
                          ),
                          const SizedBox(height: 12),
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
                            onChange: (_) => ref
                                .read(signUpVMProvider)
                                .setPublicUserEmail(emailController.text.isEmpty
                                    ? null
                                    : emailController.text.trim()),
                            validate: (value) {
                              if (value == "") {
                                return value?.hasData(
                                    fieldName: "Email address");
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
                                return value?.hasData(fieldName: "Password");
                              }
                              return value?.hasMinLengthOf(6);
                            },
                          ),
                          const SizedBox(height: 32),
                          CustomButton(
                            isLoading: false,
                            buttonText: 'Let me in',
                            backgroundColor: AppColors.primary,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 55,
                            borderRadius: 11,
                            onPressed: () async {
                              // await context.router.pushAndPopUntil(
                              //     const MainRoute(),
                              //     predicate: (_) => false);
                              if (formKey.currentState!.validate()) {
                                await ref.read(signUpVMProvider).signUp(
                                      context,
                                    );
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

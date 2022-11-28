import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';
import 'package:kitapp/view/shared/widgets/custom_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 44,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  buttonText: 'Let me in',
                  backgroundColor: AppColors.primary,
                  width: MediaQuery.of(context).size.width - 40,
                  height: 55,
                  borderRadius: 11,
                  onPressed: () async {
                    await context.router.replace(const MainRoute());
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

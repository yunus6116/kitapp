import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/router.gr.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CustomButton(
              buttonText: 'I need an accaount',
              backgroundColor: AppColors.primary,
              width: MediaQuery.of(context).size.width - 40,
              height: 55,
              borderRadius: 11,
              onPressed: () async {},
            ),
            const SizedBox(height: 24),
            CustomButton(
              buttonText: 'I\'m already a Kitapper 👌🏻',
              backgroundColor: AppColors.whiteButtonColor,
              width: MediaQuery.of(context).size.width - 40,
              textColor: AppColors.primary,
              height: 55,
              borderRadius: 11,
              showShadow: true,
              onPressed: () async {
                await context.router.navigate(SignInRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}

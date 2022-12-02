import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';
import '../../../shared/widgets/custom_button.dart';
import 'viewmodel/my_profile_page_viewmodel.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'My Profile Page',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              buttonText: 'Log out',
              backgroundColor: AppColors.primary,
              height: 55,
              borderRadius: 11,
              width: MediaQuery.of(context).size.width - 40,
              onPressed: () async {
                await ref.read(myProfileVMProvider).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

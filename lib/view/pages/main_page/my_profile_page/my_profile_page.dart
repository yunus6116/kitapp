import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/main_page/my_profile_page/dump_data.dart';
import 'package:kitapp/view/shared/widgets/favorite_books.dart';
import 'package:kitapp/view/shared/widgets/profile.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';
import '../../../shared/widgets/custom_button.dart';
import 'viewmodel/my_profile_page_viewmodel.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: CustomAppbar(
        title: 'My Profile Page',
        showBackButton: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          FavoriteBooksWidget(),
          const SizedBox(height: 36),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
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
              )),
        ],
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xff4D506C)),
        ),
        Text(
          user.email,
          style: const TextStyle(fontSize: 13, color: Color(0xff4D506C)),
        ),
      ],
    );

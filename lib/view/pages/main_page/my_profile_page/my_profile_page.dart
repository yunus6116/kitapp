import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/main_page/my_profile_page/dump_data.dart';
import 'package:kitapp/view/shared/widgets/favorite_books.dart';
import 'package:kitapp/view/shared/widgets/profile.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/profile_numbers.dart';
import 'viewmodel/my_profile_page_viewmodel.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Profile Page',
        showBackButton: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 12),
          NumbersWidget(),
          const SizedBox(height: 24),
          buildAbout(user),
          const SizedBox(height: 12),
          FavoriteBooksWidget(),
          const SizedBox(height: 36),
          Padding(
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
              )),
        ],
      ),
    );
  }
}

Widget buildAbout(User user) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          user.email,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        )
      ],
    );

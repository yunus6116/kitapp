import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/global_models/public_user/public_user_model.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import 'package:kitapp/view/shared/widgets/profile.dart';
import 'package:auto_route/auto_route.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_button.dart';
import 'viewmodel/my_profile_page_viewmodel.dart';
import '../../../../core/init/auth_manager/auth_manager.dart';
import '../../../../core/routing/router.gr.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ProfileWidget(
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(currentUser),
          const SizedBox(height: 30),
          buildButton("My Favourite Books", "profile_favourite", context),
          const Divider(
            color: Color(0xff4D506C),
            indent: 20,
            endIndent: 20,
            thickness: 0.1,
          ),
          buildButton("Change Password", "profile_change_password", context,
              isChangePassword: true),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomButton(
                      icon: SvgPicture.asset('assets/svg/profile_logout.svg'),
                      buttonText: 'Logout',
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
          )),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }
}

Widget buildName(PublicUser? user) => Column(
      children: [
        Text(
          "${user?.firstName ?? "Name"} ${user?.lastName ?? "Surname"}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xff4D506C)),
        ),
        Text(
          user?.email ?? "Email",
          style: const TextStyle(fontSize: 13, color: Color(0xff4D506C)),
        ),
      ],
    );
Widget buildButton(String title, String iconName, BuildContext context,
        {bool isChangePassword = false}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: SvgPicture.asset(
            "assets/svg/$iconName.svg",
          ),
          title: Text(
            title,
            style: AppTextStyles.body6.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          textColor: const Color(0xff4D506C),
          iconColor: const Color(0xff4D506C),
          minLeadingWidth: 15,
          onTap: () async {
            if (isChangePassword) {
              await context.router
                  .navigate(ForgotPasswordRoute(title: 'Change Password'));
            } else {
              await context.router
                  .navigate(BookGridListRoute(title: "My Favourite Books"));
            }
          },
        ),
      ],
    );

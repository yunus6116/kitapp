import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'My Profile Page',
        showBackButton: false,
      ),
    );
  }
}

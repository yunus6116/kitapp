import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Login'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Home Page'),
    );
  }
}

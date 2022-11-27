import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Explore Page'),
    );
  }
}

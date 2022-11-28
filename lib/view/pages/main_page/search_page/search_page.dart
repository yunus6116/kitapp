import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Search Page',
        showBackButton: false,
      ),
    );
  }
}

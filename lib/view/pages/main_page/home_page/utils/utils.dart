import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 3,
      ),
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}

class NoGlowScrollBehavior extends MaterialScrollBehavior  {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

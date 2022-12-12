import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          //buildImage(),
          SizedBox(
            child: SvgPicture.asset(
              'assets/svg/profile_icon.svg',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

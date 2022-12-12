import 'package:flutter/material.dart';

class FavoriteBooksWidget extends StatelessWidget {
  // final String imagePath;
  // final VoidCallback onClicked;

  // const FavoriteBooksWidget(
  //     {super.key, required this.imagePath, required this.onClicked});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            'Favorite Books',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      );
}

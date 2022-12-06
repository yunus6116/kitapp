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
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildImage(
                  'https://marketplace.canva.com/EAD51V3O7Hg/1/0/1003w/canva-beyaz-gece-g%C3%B6ky%C3%BCz%C3%BC-otobiyografi-kitap-kapa%C4%9F%C4%B1-byiM1lwz9y0.jpg'),
              buildImage(
                  'https://marketplace.canva.com/EAD37D84Rik/1/0/1003w/canva-bej-a%C4%9Fa%C3%A7-bilim-kurgu-kitap-kapa%C4%9F%C4%B1-XL7t2to0t_I.jpg'),
              buildImage(
                  'https://marketplace.canva.com/EAD37l-c-JI/1/0/1003w/canva-d%C3%BCnya-foto%C4%9Fraf%C4%B1-bilim-kurgu-kitap-kapa%C4%9F%C4%B1-YHqqmnLTfkQ.jpg'),
            ],
          ),
        ],
      );

  Widget buildImage(String url) {
    // final image = NetworkImage(imagePath);
    final image = NetworkImage(url);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 100,
          height: 160,
          // child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }
}

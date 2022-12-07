import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';

import '../../../shared/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildImage(String url) {
      // final image = NetworkImage(imagePath);
      final image = NetworkImage(url);

      return Padding(
        padding: const EdgeInsets.only(right: 10),
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

    return Scaffold(
      appBar: CustomAppbar(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/app_logo.svg'),
            const SizedBox(width: 8),
            Text(
              'KITAPP',
              style: AppTextStyles.heading7,
            )
          ],
        ),
        showBackButton: false,
      ),
      body: Column(
        children: [
          // Banner

          // Editor's Choice
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Editor\'s Choice', style: AppTextStyles.heading6),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
            ),
          ),
          const SizedBox(height: 24),
          // Top Sellers
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top Sellers', style: AppTextStyles.heading6),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildImage(
                        'https://marketplace.canva.com/EAD37l-c-JI/1/0/1003w/canva-d%C3%BCnya-foto%C4%9Fraf%C4%B1-bilim-kurgu-kitap-kapa%C4%9F%C4%B1-YHqqmnLTfkQ.jpg'),
                    buildImage(
                        'https://marketplace.canva.com/EAD51V3O7Hg/1/0/1003w/canva-beyaz-gece-g%C3%B6ky%C3%BCz%C3%BC-otobiyografi-kitap-kapa%C4%9F%C4%B1-byiM1lwz9y0.jpg'),
                    buildImage(
                        'https://marketplace.canva.com/EAD37D84Rik/1/0/1003w/canva-bej-a%C4%9Fa%C3%A7-bilim-kurgu-kitap-kapa%C4%9F%C4%B1-XL7t2to0t_I.jpg'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

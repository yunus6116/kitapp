import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/main_page/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import 'package:kitapp/view/shared/widgets/shimmers/shimmer_effect.dart';

import '../../../shared/widgets/custom_appbar.dart';

class HomePage extends StatefulHookConsumerWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    ref.read(homePageVMProvider).getEditorsChoiceList();
  }

  @override
  Widget build(BuildContext context) {
    final current = useState(0);
    final sliderList = ref.read(homePageVMProvider).sliderList;
    final editorsChoiceList = ref.watch(homePageVMProvider).editorsChoiceList;
    final topSellersList = ref.watch(homePageVMProvider).topSellersList;

    Widget buildImage(String url) {
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
          CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                current.value = index;
              },
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              child: Image.asset(
                sliderList[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: current.value == entry.key
                        ? AppColors.primary
                        : AppColors.passiveColor,
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    // Editor's Choice
                    editorsChoiceList.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: ShimmerEffect(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(right: 4),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .33,
                                        color: Colors.white,
                                      );
                                    }))),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: editorsChoiceList.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: editorsChoiceList[index]
                                                .coverImageUrl ??
                                            '',
                                        placeholder: (_, __) => ShimmerEffect(
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        imageBuilder: (_, imageLink) {
                                          return Material(
                                            type: MaterialType.transparency,
                                            child: SizedBox.expand(
                                              child: Container(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    Column(
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
                    const SizedBox(height: 24),
                    // Top Sellers
                    Column(
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

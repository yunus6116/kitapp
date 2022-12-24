import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../shared/styles/colors.dart';

class BannerSliderWidget extends HookWidget {
  BannerSliderWidget({
    Key? key,
    required this.sliderList,
  }) : super(key: key);

  final List<String> sliderList;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final current = useState(0);

    return Column(
      children: [
        // Banner
        SizedBox(
          height: MediaQuery.of(context).size.height * .22,
          width: double.infinity,
          child: CarouselSlider.builder(
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
              width: double.infinity,
              child: Image.asset(
                sliderList[itemIndex],
                fit: BoxFit.cover,
              ),
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
                margin:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
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
      ],
    );
  }
}

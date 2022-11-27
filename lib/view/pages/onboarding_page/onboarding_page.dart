import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/enums/app_images.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/core/extensions/list_extensions.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import 'package:kitapp/view/shared/styles/colors.dart';

import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/theme_manager/theme_manager.dart';
import '../../shared/styles/text_styles.dart';
import '../../shared/widgets/custom_button.dart';
import 'viewmodel/onboarding_viewmodel.dart';

part "./widgets/page_indicators.dart";

part "./widgets/intro_slide.dart";

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final pageController = usePageController();

    useEffect(() {
      ref
          .read(cacheManagerProvider)
          .writeToBox<bool>(BoxKey.seenOnboardingPages, true);
      return null;
    }, [key]);

    final introSlides = [
      _IntroSlide(
        title: 'Only Books Can Help You',
        description:
            'Books can help you to increase your knowledge and become more successfully.',
        imagePath: SvgImages.onboardingFirst.path,
      ),
      _IntroSlide(
        title: 'Learn Smartly',
        description:
            'It’s 2022 and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your phone',
        imagePath: SvgImages.onboardingSecond.path,
      ),
      _IntroSlide(
        title: 'Book Has Power To Change Everything',
        description:
            'We have true friend in our life and the books is that. Book has power to chnage yourself and make you more valueable.',
        imagePath: PngImages.onboardingThird.path,
      ),
    ];

    void onNextClick() {
      if (pageController.page?.round() == 0) {
        pageController.nextPage(
            duration: theme.normalDuration, curve: Curves.easeIn);
        ref.read(onBoardingVMProvider).setCurrentIntroIndex(1);
        return;
      }
      if (pageController.page?.round() == 1) {
        pageController.nextPage(
            duration: theme.normalDuration, curve: Curves.easeIn);
        ref.read(onBoardingVMProvider).setCurrentIntroIndex(2);
        return;
      }
      if (pageController.page?.round() == 2) {
        context.router.replace(const MainRoute());
      }
      context.popRoute();
    }

    return Scaffold(
      backgroundColor: AppColors.onboardingBgColor,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Geri', style: AppTextStyles.heading1),
                    TextButton(
                        onPressed: context.popRoute,
                        child: Text('Skip',
                            style: AppTextStyles.textButton2
                                .copyWith(color: theme.primary[600]))),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: context.responsiveHeight(22)),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: introSlides.length,
                    onPageChanged:
                        ref.read(onBoardingVMProvider).setCurrentIntroIndex,
                    itemBuilder: (_, int index) => introSlides[index],
                  ),
                ),
              ),
              _PageIndicators(),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                  width: double.infinity,
                  buttonText: 'Next',
                  onPressed: onNextClick)
            ],
          ),
        ),
      ),
    );
  }
}

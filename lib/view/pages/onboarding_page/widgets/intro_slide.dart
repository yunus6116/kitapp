part of '../onboarding_page.dart';

class _IntroSlide extends HookConsumerWidget {
  final String title;
  final String description;
  final String imagePath;

  const _IntroSlide({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String lastImageName = 'third';
    return Column(
      children: [
        Expanded(
          child: imagePath.contains(lastImageName)
              ? Image.asset(imagePath)
              : SvgPicture.asset(imagePath),
        ),
        Gap(context.responsiveHeight(12)),
        Text(title, style: AppTextStyles.heading2),
        Gap(context.responsiveHeight(12)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            style: AppTextStyles.body2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

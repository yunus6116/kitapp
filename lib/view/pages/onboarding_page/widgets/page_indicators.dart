part of '../onboarding_page.dart';

class _PageIndicators extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int indicatorCount = 3;
    final theme = ref.watch(themeProvider);
    final currentIntroIndex = ref
        .watch(onBoardingVMProvider.select((value) => value.currentIntroIndex));

    Widget buildCircle(int index) => AnimatedContainer(
          duration: theme.normalDuration,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: theme.primary),
              shape: BoxShape.circle,
              color: index == currentIntroIndex
                  ? theme.primary
                  : theme.scaffoldBackground),
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(indicatorCount, buildCircle).withGap(10),
    );
  }
}

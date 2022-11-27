part of '../onboarding_page.dart';

class _PageIndicators extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final currentIntroIndex = ref
        .watch(onBoardingVMProvider.select((value) => value.currentIntroIndex));

    Widget _buildCircle(int index) => AnimatedContainer(
          duration: theme.normalDuration,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: theme.primary[400]!),
              shape: BoxShape.circle,
              color: index == currentIntroIndex
                  ? theme.primary[400]!
                  : theme.scaffoldBackground),
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(2, _buildCircle).withGap(10),
    );
  }
}

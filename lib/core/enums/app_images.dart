import 'package:recase/recase.dart';

enum PngImages {
  example,
}

enum SvgImages {
  onboardingFirst,
  onboardingSecond,
  onboardingThird,
}

enum LottieAnimation { loadingAnimation, searchAnimation, allAround }

extension AppPngExtensions on PngImages {
  String get path => "assets/png/${name.snakeCase}.png";
}

extension AppSvgExtensions on SvgImages {
  String get path => "assets/svg/${name.snakeCase}.svg";
}

extension LottieAnimationExtensions on LottieAnimation {
  String get path => "assets/lottie/${name.snakeCase}.json";
}

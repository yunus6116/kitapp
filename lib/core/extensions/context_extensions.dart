import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_snackbar.dart';
import '../global_constants/global_constants.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double responsiveWidth(double value) => (value * width) / kDesignWidth;
  double responsiveHeight(double value) => (value * height) / kDesignHeight;
  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension MediaQueryExtension on BuildContext {
  double get height => kIsWeb ? kDesignHeight : mediaQuery.size.height;
  double get width => kIsWeb ? kDesignWidth : mediaQuery.size.width;

  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get smallPaddingValue => height * 0.02216;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get normalPadding => const EdgeInsets.all(16);
  EdgeInsetsGeometry get lowPadding => const EdgeInsets.all(5);
  EdgeInsetsGeometry get horizontalNormalPadding =>
      const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsetsGeometry get horizontalLowPadding =>
      const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsetsGeometry get verticalLowPadding =>
      const EdgeInsets.symmetric(vertical: 10);
  EdgeInsetsGeometry get rightHorizontalLowPadding =>
      const EdgeInsets.only(right: 10);
}

extension SnackbarExtension on BuildContext {
  showSnackBar({
    String? message,
    dynamic error,
    SnackBarType snackBarType = SnackBarType.error,
    Duration? duration,
    String? actionLabel,
    VoidCallback? action,
    Widget? content,
  }) {
    var snackMessage = message ?? "";
    if (error != null) {
      if (error is DioError) {
        if (error.response?.statusCode == 500) {
          debugPrint("ERROR 2 --> $error");
          snackMessage = "Server Error";
        } else {
          snackMessage = error.response?.data?["message"] ?? "";
        }
      } else {
        debugPrint("ERROR --> $error");
        snackMessage = message ?? "An error occurred";
      }
    }
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(CustomSnackBar.show(
      message: snackMessage,
      snackBarType: snackBarType,
      duration: duration ?? const Duration(milliseconds: 2500),
      actionLabel: actionLabel,
      action: action,
      content: content,
    ));
  }
}

extension ShowModalBottomSheetExtension on BuildContext {
  Future<T?> showBottomSheet<T>(
      {required Widget child,
      bool useRootNavigator = true,
      bool? isDismissible,
      bool? enableDrag}) async {
    return await showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
            top: context.responsiveHeight(32),
            bottom: mediaQuery.viewInsets.bottom + 30),
        child: child,
      ),
    );
  }
}

extension ApiCallExtension on BuildContext {
  makeApiCall(Function apiCallFunction) async {
    try {
      await apiCallFunction();
    } catch (e) {
      showSnackBar(error: e);
    }
  }
}

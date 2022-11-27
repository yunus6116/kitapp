import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kitapp/view/shared/widgets/custom_snackbar.dart';

import '../global_constants/global_constants.dart';

extension SnackbarExtension on GlobalKey<ScaffoldMessengerState> {
  showSnackBar({
    String? message,
    dynamic error,
    SnackBarType snackBarType = SnackBarType.error,
    Duration? duration,
    String? actionLabel,
    VoidCallback? action,
    Widget? content,
  }) {
    final isDioError = error is DioError;
    var snackMessage =
        message ?? (isDioError ? error.errorMessage : "Some error occurred");

    SnackBar showSnackBar() {
      return CustomSnackBar.show(
        message: snackMessage,
        snackBarType: snackBarType,
        duration: duration ?? const Duration(milliseconds: 2500),
        actionLabel: actionLabel,
        action: action,
        content: content,
      );
    }

    snackBarKey.currentState?.clearSnackBars();
    snackBarKey.currentState?.showSnackBar(showSnackBar());
  }
}

extension DioErrorExtension on DioError? {
  String get errorMessage {
    String snackMessage = "";

    debugPrint(toString());
    if (this != null) {
      if (this?.type == DioErrorType.receiveTimeout) {
        snackMessage = "Timeout error";
      } else if (this!.response?.statusCode == 500) {
        debugPrint("ERROR 2 --> ${toString()}");
        snackMessage = "Server Error";
      } else if (this!.response?.statusCode == 400) {
        snackMessage = this!.response?.data["errors"][0]["msg"];
      } else {
        debugPrint("ERROR 2 --> ${toString()}");
        snackMessage = this!.response?.data;
      }
    }
    return snackMessage;
  }

  int? get errorCode {
    int? code;
    if (this != null) {
      return this!.response?.statusCode;
    }
    return code;
  }
}

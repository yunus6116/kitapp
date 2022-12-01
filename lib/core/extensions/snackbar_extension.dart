import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../view/shared/widgets/custom_snackbar.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

extension SnackbarExtension on dynamic {
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
        if (error.response!.statusCode == 500) {
          debugPrint("ERROR 2 --> $error");
          snackMessage = "Server Hatası";
        } else {
          snackMessage = error.response?.data?["message"] ?? "";
        }
      } else {
        debugPrint("ERROR --> $error");
        snackMessage = message ?? "Bir hata oluştu";
      }
    }

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

    if (this is BuildContext) {
      ScaffoldMessenger.of(this).clearSnackBars();
      ScaffoldMessenger.of(this).showSnackBar(showSnackBar());
    }
    if (this is GlobalKey) {
      snackbarKey.currentState?.clearSnackBars();
      snackbarKey.currentState?.showSnackBar(showSnackBar());
    }
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

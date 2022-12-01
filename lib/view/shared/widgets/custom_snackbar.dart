import 'package:flutter/material.dart';

enum SnackBarType { success, error }

class CustomSnackBar {
  static SnackBar show(
      {String? message,
      required SnackBarType snackBarType,
      required Duration duration,
      Widget? content,
      String? actionLabel,
      VoidCallback? action}) {
    return SnackBar(
      action: (action != null && actionLabel != null)
          ? SnackBarAction(label: actionLabel, onPressed: action)
          : null,
      duration: duration,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 9),
      backgroundColor: snackBarType == SnackBarType.error
          ? const Color(0xFFDC2D2D)
          : snackBarType == SnackBarType.success
              ? const Color(0xFF52C41A)
              : const Color(0xFFF8F8F8),
      content: message != ""
          ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  child: Text(
                message!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ))
            ])
          : content ?? const SizedBox(),
    );
  }
}

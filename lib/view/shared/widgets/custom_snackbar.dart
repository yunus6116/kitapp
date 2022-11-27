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
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
      backgroundColor: snackBarType == SnackBarType.error
          ? const Color(0xFFDC2D2D)
          : content == null
              ? const Color(0xFFF8F8F8)
              : const Color(0xFFBFFCC2),
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: message != ""
              ? Text(
                  message!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: snackBarType == SnackBarType.error
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              : content ?? const SizedBox(),
        )
      ]),
    );
  }
}

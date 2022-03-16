import 'package:flutter/material.dart';

abstract class SnackBarUtils {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          content: Text(message),
        ),
      );
  }
}

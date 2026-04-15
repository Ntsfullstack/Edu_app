import 'package:flutter/material.dart';

SnackBar customSnackbar({
  required String message,
  Color backgroundColor = Colors.black87,
  Duration duration = const Duration(seconds: 3),
}) {
  return SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
}
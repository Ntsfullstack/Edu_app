import 'package:flutter/material.dart';

enum SnackbarType { success, error, info }

void showCustomSnackbar(
  BuildContext context, {
  required String message,
  SnackbarType type = SnackbarType.info,
}) {
  final backgroundColor = {
    SnackbarType.success: const Color(0xFF4CAF50),
    SnackbarType.error: const Color(0xFFFF4B4B),
    SnackbarType.info: Colors.black87,
  }[type];

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      elevation: 4,
    ),
  );
}
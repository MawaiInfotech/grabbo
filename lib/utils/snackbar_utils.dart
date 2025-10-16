import 'package:flutter/material.dart';

class SnackBarUtils {
  static void show(
      BuildContext context, {
        required String message,
        bool isSuccess = true,
      }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor:
      isSuccess ? Colors.green.shade600 : Colors.red.shade600,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          Icon(
            isSuccess
                ? Icons.check_circle_outline
                : Icons.error_outline,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

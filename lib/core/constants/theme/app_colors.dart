library;

import 'package:flutter/material.dart';

/// A singleton-style class that provides access to all color values
/// used throughout the application.
///
/// Helps centralize color references to improve code maintainability
/// and reduce the risk of typos in color values.
///
/// Example usage:
/// ```dart
/// Container(
///   color: AppColors.primaryColor,
/// );
/// ```

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  static const Color primaryColor = Color(0xFF1E1745);

  static const Color secondaryColor = Color(0xFFD80B19);

  static const Color backgroundColor = Color(0xFFF5F5F5);

  static const Color textColor = Color(0xFF343131);

  static const Color green = Color(0xFF88B51F);

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xF0000000);

  static const Color darkRed = Color.fromARGB(255, 108, 7, 19);

  static const Color borderColor = Color(0xff70707040);

  static const Color btnDisabled = Color(0xffF0F3F5);

  static const Color btnDisabledText = Color(0xff333333);
}

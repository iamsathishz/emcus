import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// A singleton-style class that provides access to all gradient styles
/// used throughout the application.
///
/// Centralizes gradient references to improve code maintainability
/// and design consistency.
///
/// Example usage:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     gradient: AppGradients.linearPrimaryToSecondary,
///   ),
/// );
/// ```

class AppGradients {
  AppGradients._(); // Private constructor to prevent instantiation

  static final LinearGradient homeCardGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      const Color(0xff1BA47F),
      const Color(0xff160961).withOpacity(0.4),
    ],
    stops: const [0.0, 0.6],
  );
  static final LinearGradient appBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.secondaryColor,
      AppColors.darkRed,
    ],
  );
  static final LinearGradient splashScreenGradient = LinearGradient(
    colors: [
      AppColors.secondaryColor,
      Color.fromARGB(255, 108, 7, 19),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

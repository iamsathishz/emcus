import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthRoundedCard extends StatelessWidget {
  final Widget child;
  const AuthRoundedCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}

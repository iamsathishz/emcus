import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFieldTitle extends StatelessWidget {
  const CustomTextFieldTitle({
    super.key,
    this.isRequired = false,
    this.titleTrailing,
    required this.title,
    this.child,
    this.bodyTitleGap = 2,
    this.padding,
  });

  final bool isRequired;
  final String title;
  final Widget? titleTrailing;
  final Widget? child;
  final double bodyTitleGap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        title,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                        color: AppColors.textColor,
                      ),
                    ),
                    if (isRequired)
                      CustomText(
                        "*",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor,
                      ),
                  ],
                ),
              ),
              titleTrailing ?? const SizedBox.shrink()
            ],
          ),
          SizedBox(
            height: bodyTitleGap,
          ),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}

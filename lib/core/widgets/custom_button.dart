import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_fonts.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTapped;
  Color? buttonColor;
  double? buttonHeight;
  double? borderRadius;
  FontWeight? fontWeight;
  double? fontSize;
  Color? fontColor;
  String? fontFamily;
  double? buttonWidth;
  BoxBorder? border;
  Widget? extraChild;
  Widget? iconWidget;
  bool isLoading;
  CustomButton(
      {super.key,
      required this.text,
      required this.onTapped,
      this.border,
      this.extraChild,
      this.buttonColor,
      this.buttonHeight,
      this.borderRadius,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
      this.fontFamily,
      this.iconWidget,
      this.isLoading = false,
      this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 50,
      width: buttonWidth,
      decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          color: buttonColor ?? AppColors.secondaryColor),
      child: Material(
        color: buttonColor ?? AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          onTap: isLoading ? null : onTapped,
          child: Center(
            child: isLoading
                ? Transform.scale(
                    scale: 0.8,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: iconWidget ?? const SizedBox(),
                      ),
                      CustomText(
                        text,
                        fontFamily: fontFamily ?? AppFonts.humanst521BT,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        fontSize: fontSize ?? 16,
                        color: fontColor ?? Colors.white,
                        letterSpacing: 0.1,
                      ),
                      extraChild ?? const SizedBox()
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

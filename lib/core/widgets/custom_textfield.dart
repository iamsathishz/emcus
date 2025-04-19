import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isDense;
  final TextStyle? textStyle;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final EdgeInsets? contentPadding;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final bool? isObscureText;
  final String? obscuringCharacter;
  final String? hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? fillColor;
  final bool filled;
  final int? maxLine;
  final int? minLine;
  final bool isError;
  final BoxConstraints? suffixConstraints;
  final BoxConstraints? prefixIconConstraints;
  final Function(String val)? onChanged;
  final Function(String? val)? onSubmit;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ScrollController? scrollController;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      this.prefix,
      this.keyboardType,
      this.isDense = true,
      this.textStyle,
      this.focusedBorder,
      this.errorBorder,
      this.contentPadding,
      this.prefixIconConstraints,
      required this.controller,
      this.validator,
      this.suffix,
      this.isObscureText,
      this.obscuringCharacter,
      this.hintText,
      this.onTap,
      this.readOnly = false,
      this.fillColor,
      this.filled = true,
      this.suffixConstraints,
      this.isError = false,
      this.maxLine = 1,
      this.minLine = 1,
      this.onChanged,
      this.onSubmit,
      this.textInputAction,
      this.scrollController,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSubmit,
      controller: controller,
      obscureText: isObscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? "*",
      readOnly: readOnly,
      style: textStyle ??
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.humanst521BT,
            color: AppColors.textColor,
          ),
      validator: validator,
      maxLines: maxLine,
      minLines: minLine,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      scrollController: scrollController,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: fillColor ?? AppColors.white,
        hintText: hintText,
        suffixIconConstraints: suffixConstraints,
        prefixIconConstraints: prefixIconConstraints,
        filled: filled,
        suffixIcon: suffix,
        prefixIcon: prefix,
        isDense: isDense,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.humanst521BT,
          letterSpacing: 0.1,
          color: AppColors.textColor.withOpacity(0.5),
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 11,
            ),
        focusedBorder: isError
            ? _errorBorder
            : focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
        enabledBorder: isError
            ? _errorBorder
            : focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
            ),
        focusedErrorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
            ),
      ),
    );
  }
}

var _errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: AppColors.secondaryColor,
    width: 1.5,
  ),
);

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: CustomText(text,
            // fontFamily: FontFamily.Satoshi.name,
            fontSize: 13,
            fontWeight: FontWeight.w700));
  }
}

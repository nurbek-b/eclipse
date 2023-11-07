import 'package:eclipse_app/src/themes/app_font.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpace.vertical(10),
        Text(
          text,
          maxLines: 2,
          style: AppTextStyle.white(
            fontSize: AppFontSize.f16,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ],
    );
  }
}

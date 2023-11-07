import 'package:eclipse_app/src/themes/app_font.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:flutter/material.dart';

Widget errorDialog({
  required String message,
  Function()? onPressed,
}) {
  return SizedBox(
    width: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppTextStyle.grey60(
            fontSize: AppFontSize.f16,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              "Retry",
              style: AppTextStyle.white(
                fontSize: AppFontSize.f16,
                fontWeight: AppFontWeight.semiBold,
              ),
            )),
      ],
    ),
  );
}

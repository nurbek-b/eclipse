import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:eclipse_app/src/themes/app_assets.dart';
import 'package:eclipse_app/src/themes/app_font.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:flutter/material.dart';

class TitleCardWidget extends StatelessWidget {
  const TitleCardWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              maxLines: 2,
              style: AppTextStyle.white(
                fontSize: AppFontSize.f16,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            Text(
              user.company.name,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.white(fontSize: AppFontSize.f12),
            ),
          ],
        ),
      ],
    );
  }
}

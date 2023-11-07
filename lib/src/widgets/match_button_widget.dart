import 'package:eclipse_app/src/themes/app_assets.dart';
import 'package:flutter/material.dart';

class MatchButtonWidget extends StatelessWidget {
  const MatchButtonWidget({
    Key? key,
    this.dimension = 50,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  final double dimension;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAsset.icon(iconPath)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

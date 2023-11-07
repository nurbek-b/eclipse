import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:eclipse_app/src/widgets/match_button_widget.dart';
import 'package:flutter/material.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({Key? key, required this.controller})
      : super(key: key);

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'left_arrow.png',
          onTap: () {
            controller.swipeLeft();
          },
        ),
        AppSpace.horizontal(20),
        MatchButtonWidget(
          iconPath: 'right_arrow.png',
          onTap: () {
            controller.swipeRight();
          },
        ),
      ],
    );
  }
}

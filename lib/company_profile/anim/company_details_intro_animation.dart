import 'package:flutter/material.dart';

//todo 1 (finish)
class CompanyDetailsIntroAnimation {
  AnimationController controller;
  Animation<double> bgDropOpacity;
  Animation<double> bgDropBlur;
  Animation<double> avatarSize;

// Animation<double> nameOpacity;
// Animation<double> locationOpacity;
// Animation<double> dividerWidth;
// Animation<double> aboutOpacity;
// Animation<double> courseScrollerXTranslation;
// Animation<double> courseScrollerOpacity;

  CompanyDetailsIntroAnimation({
    required this.controller,
  })  : bgDropOpacity = Tween(begin: 0.5, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 0.500, curve: Curves.ease),
          ),
        ),
        bgDropBlur = Tween(begin: 0.0, end: 5.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 0.800, curve: Curves.ease),
          ),
        ),
        avatarSize = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.100, 0.400, curve: Curves.elasticInOut),
          ),
        );
}

import 'package:flutter/material.dart';

//todo 2 (next company_details_animator)
class CompanyDetailsIntroAnimation {
  AnimationController controller;
  Animation<double> bgDropOpacity;
  Animation<double> bgDropBlur;
  Animation<double> avatarSize;
  Animation<double> nameOpacity;
  Animation<double> locationOpacity;
  Animation<double> dividerWidth;
  Animation<double> aboutOpacity;

  Animation<double> courseScrollerXTranslation;
  Animation<double> courseScrollerOpacity;

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
        ),
        nameOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.350,
              0.450,
              curve: Curves.easeIn,
            ),
          ),
        ),
        locationOpacity = Tween(begin: 0.0, end: 0.84).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.500,
              0.600,
              curve: Curves.easeIn,
            ),
          ),
        ),
        dividerWidth = Tween(begin: 0.0, end: 225.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.650,
              0.750,
              curve: Curves.elasticInOut,
            ),
          ),
        ),
        aboutOpacity = Tween(begin: 0.0, end: 0.85).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.750,
              0.900,
              curve: Curves.easeIn,
            ),
          ),
        ),
        courseScrollerXTranslation = Tween(begin: 60.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.830,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        courseScrollerOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.830, 1.000, curve: Curves.fastOutSlowIn),
          ),
        );
}

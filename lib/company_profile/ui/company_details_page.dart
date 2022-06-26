import 'package:animaton_with_flutter/company_profile/anim/company_details_intro_animation.dart';
import 'package:animaton_with_flutter/company_profile/model/company.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

//todo 1 (next company_details_animator)
class CompanyDetailsPage extends StatelessWidget {
  final Company company;
  final AnimationController controller;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage({
    required this.company,
    required this.controller,
  }) : animation = CompanyDetailsIntroAnimation(controller: controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: _createAnimation,
      ),
    );
  }

  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: animation.bgDropOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: animation.bgDropBlur.value,
            sigmaY: animation.bgDropBlur.value,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        ),
      ],
    );
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createLogoAvatar(),
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
        animation.avatarSize.value,
        animation.avatarSize.value,
        1.0,
      ),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.only(top: 32, left: 19),
        padding: EdgeInsets.all(3),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(company.logo, width: 100, height: 100),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Build App',
                style: TextStyle(
                  fontSize: 19 * animation.avatarSize.value + 2,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

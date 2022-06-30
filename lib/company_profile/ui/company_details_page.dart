import 'package:animaton_with_flutter/company_profile/anim/company_details_intro_animation.dart';
import 'package:animaton_with_flutter/company_profile/model/company.dart';
import 'package:animaton_with_flutter/company_profile/ui/course_card.dart';
import 'package:flutter/cupertino.dart';
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
          _createAboutCompany(),
          _createCourseScroller(),
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

  Widget _createAboutCompany() {
    return Padding(
      padding: EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company.name,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontSize: 30 * animation.avatarSize.value + 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            company.location,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.79),
            margin: EdgeInsets.symmetric(vertical: 14),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          Text(
            company.about,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.aboutOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: EdgeInsets.only(top: 14),
      child: Transform(
        transform: Matrix4.translationValues(
          animation.courseScrollerXTranslation.value,
          0.0,
          0.0,
        ),
        child: SizedBox.fromSize(
          size: Size.fromHeight(250),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 7),
            itemCount: company.courses.length,
            itemBuilder: (BuildContext context,int index){
              var course = company.courses[index];
              return CourseCard(course: course);
            },
          ),
        ),
      ),
    );
  }
}

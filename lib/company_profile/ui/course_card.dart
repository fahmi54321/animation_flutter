import 'package:animaton_with_flutter/company_profile/model/company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: _createShadowRoundCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),
          Flexible(
            flex: 2,
            child: _createCourseInfo(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 10),
        ]);
  }

  Widget _createCourseInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 4, right: 4),
      child: Text(
        course.title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    );
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.asset(course.thumbnail),
          Positioned(
            bottom: 12,
            right: 12,
            child: _createLinkButton(),
          ),
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
        onPressed: () async {
          if (await canLaunchUrl(Uri.parse(course.url))) {
            await launchUrl(Uri.parse(course.url));
          }
        },
        icon: Icon(Icons.link),
      ),
    );
  }
}

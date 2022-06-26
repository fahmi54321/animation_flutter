import 'package:animaton_with_flutter/company_profile/model/company.dart';

//todo 2 (finish)
class RepoData {
  static final Company bawp = Company(
    name: 'Build Apps With Paulo',
    about:
        'Our goal is to teach you the skills and equip you with the tools to become the best mobile developer and programmer you can be. '
        ' We want to make you a well-rounded developer.  That’s the mission.',
    backdropPhoto: 'assets/bawp_creator.png',
    courses: <Course>[
      Course(
          title: 'The Complete Android & Java Bootcamp',
          thumbnail: 'assets/android_bootcamp.png',
          url:
              'https://www.udemy.com/the-complete-android-bootcamp-course-material-design-uiux/?couponCode=BAWP-SITE-COURSE-15'),
      Course(
          title: 'Kotlin Android Development Masterclass',
          thumbnail: 'assets/kotlin.png',
          url:
              'https://www.udemy.com/kotlin-android-developer-masterclass/?couponCode=BAWP-SITE-COURSES-15'),
      Course(
          title: 'Java Design Patterns',
          thumbnail: 'assets/java_design-pats.png',
          url:
              'https://www.udemy.com/java-design-patterns-the-complete-masterclass/?couponCode=BAWP-SITE-COURSES-15'),
      Course(
          title: 'The Java 9 Master Course',
          thumbnail: 'assets/java9_course.png',
          url:
              'https://www.udemy.com/the-complete-java-9-masterclass-beginner-to-expert/?couponCode=BAWP-SITE-COURSES-15'),
      Course(
          title: 'Android Developer Portfolio',
          thumbnail: 'assets/android_portfolio.png',
          url:
              'https://www.udemy.com/android-developers-portfolio-masterclass-build-7-apps/?couponCode=BAWP-SITE-COURSES-15')
    ],
    location: 'Spokane, WA',
    logo: 'assets/logo.png',
  );
}

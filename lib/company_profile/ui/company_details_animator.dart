import 'package:animaton_with_flutter/company_profile/repo/repo.dart';
import 'package:animaton_with_flutter/company_profile/ui/company_details_page.dart';
import 'package:flutter/material.dart';

class CompanyDetailsAnimator extends StatefulWidget {
  const CompanyDetailsAnimator({Key? key}) : super(key: key);

  @override
  _CompanyDetailsAnimatorState createState() => _CompanyDetailsAnimatorState();
}

class _CompanyDetailsAnimatorState extends State<CompanyDetailsAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1780,
        ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDetailsPage(
      company: RepoData.bawp,
      controller: _controller,
    ); //todo 2 (finish)
  }
}

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
          milliseconds: 1780, // todo 1 (kasih duration)
        ));


    //todo 2 (start animation) finish
    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ChainAnimation extends AnimatedWidget {
  final Animation<double> animation;

  ChainAnimation({
    Key? key,
    required this.animation,
  }) : super(
          key: key,
          listenable: animation,
        );

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 175.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ),
        ),
      ),
    );
  }
}

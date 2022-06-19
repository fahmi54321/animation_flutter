import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );

    animation = Tween<double>(begin: 0.0, end: 10).animate(_controller)
      ..addListener(() {
        this.setState(() {});
      })
      ..addStatusListener((status) { //todo 1
        if (status == AnimationStatus.completed) { //todo 2
          _controller.reverse(from: 5.0);
          // _controller.repeat();
        }else if(status == AnimationStatus.reverse){ //todo 3 (finish)
          this.setState(() {
            _counter = _counter - 400;
          });
        }
      });

    _controller.addListener(() {
      this.setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text(
            _controller.isAnimating
                ? (_counter).toStringAsFixed(2)
                : "Let's Begin",
            style: TextStyle(fontSize: 24 * animation.value + 16),
          ),
          onTap: () {
            _controller.forward(from: 0.0);
          },
        ),
      ),
    );
  }
}

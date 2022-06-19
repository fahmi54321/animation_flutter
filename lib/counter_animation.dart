import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  const CounterAnimation({Key? key}) : super(key: key);

  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //todo 1
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

    //todo 2
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    //todo 3
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
            style: TextStyle(fontSize: 24 * _controller.value + 16),
          ),
          onTap: (){
            _controller.forward(from: 0.0);
          },
        ),
      ),
    );
  }
}

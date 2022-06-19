import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> with SingleTickerProviderStateMixin {
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
    animation = Tween<double>(begin: 0.0,end: 10).animate(_controller)
    ..addListener(() {
      this.setState(() {

      });
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
            style: TextStyle(fontSize: 24 * animation.value + 16), // todo 3 (finish)
          ),
          onTap: (){
            _controller.forward(from: 0.0);
          },
        ),
      ),
    );
  }
}

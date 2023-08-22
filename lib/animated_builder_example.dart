import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    animation = Tween(begin: 0, end: 2 * math.pi).animate(
      _controller,
    );

    setState(() {
      isLoading = false;
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: AnimatedBuilder(
                animation: animation,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Whee!'),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: double.parse(animation.value.toString()),
                    child: child,
                  );
                },
              ),
            ),
    );
  }
}

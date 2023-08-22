// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool showWelcomeUser = false;
  bool showHello = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showWelcomeUser = !showWelcomeUser;
                    });
                  },
                  child: AnimatedCrossFade(
                    crossFadeState: showWelcomeUser
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeIn,
                    sizeCurve: Curves.bounceInOut,
                    firstChild: const WidgetExample1(
                      label: 'Hello',
                      colorLabel: Colors.red,
                    ),
                    secondChild: const WidgetExample1(
                      label: 'Good bye',
                      colorLabel: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showHello = !showHello;
                    });
                  },
                  child: AnimatedCrossFade(
                    layoutBuilder:
                        (topChild, topChildKey, bottomChild, bottomChildKey) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            key: bottomChildKey,
                            top: 0,
                            // right: 0,
                            // bottom: 0,
                            child: bottomChild,
                          ),
                          Positioned(
                            key: topChildKey,
                            child: topChild,
                          ),
                        ],
                      );
                    },
                    crossFadeState: showHello
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeIn,
                    sizeCurve: Curves.bounceInOut,
                    firstChild: const WidgetExample2(
                      label: 'Hello',
                      isSquare: false,
                      colorLabel: Colors.red,
                    ),
                    secondChild: const WidgetExample2(
                      label: 'Good bye',
                      isSquare: true,
                      colorLabel: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetExample1 extends StatelessWidget {
  final String label;
  final Color colorLabel;
  const WidgetExample1({
    Key? key,
    required this.label,
    required this.colorLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.rectangle,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 48.0,
            color: colorLabel,
          ),
        ),
      ),
    );
  }
}

class WidgetExample2 extends StatelessWidget {
  final String label;
  final Color colorLabel;
  final bool isSquare;
  const WidgetExample2({
    Key? key,
    required this.label,
    required this.colorLabel,
    required this.isSquare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: isSquare ? 100.0 : 300.0,
      decoration: BoxDecoration(
        color: Colors.amber,
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 48.0, color: colorLabel),
        ),
      ),
    );
  }
}

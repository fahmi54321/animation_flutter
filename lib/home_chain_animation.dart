import 'package:animaton_with_flutter/chain_animation.dart';
import 'package:flutter/material.dart';

class HomeChainAnimation extends StatefulWidget {
  const HomeChainAnimation({Key? key}) : super(key: key);

  @override
  _HomeChainAnimationState createState() => _HomeChainAnimationState();
}

class _HomeChainAnimationState extends State<HomeChainAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1800,),);
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChainAnimation(animation: animation);
  }
}

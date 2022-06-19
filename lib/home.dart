import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //todo 1 (1 init awal animation)
  late AnimationController controller;

  //todo 4 (2 how to use controller animation)
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    //todo 2 (1 init awal animation)
    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1800),
    );

    //todo 5 (2 how to use controller animation)
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    )..addListener(() {
        setState(() {});
      }); // curve = type animation

    //todo 3 (1 init awal animation)
    controller.forward(); // play animation
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            fontSize: 20 * animation.value, //todo 6 (2 how to use controller animation) // finish
          ),
        ),
      ),
    );
  }
}

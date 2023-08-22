import 'package:animaton_with_flutter/animated_align_example.dart';
import 'package:animaton_with_flutter/animated_builder_example.dart';
import 'package:animaton_with_flutter/animated_container_example.dart';
import 'package:animaton_with_flutter/animated_cross_faded_example.dart';
import 'package:animaton_with_flutter/animated_list_example.dart';
import 'package:animaton_with_flutter/animated_text_example.dart';
import 'package:animaton_with_flutter/company_profile/ui/company_details_animator.dart';
import 'package:animaton_with_flutter/company_profile/ui/company_details_page.dart';
import 'package:animaton_with_flutter/counter_animation.dart';
import 'package:animaton_with_flutter/home_chain_animation.dart';
import 'package:animaton_with_flutter/tween_animation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1800),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    )..addListener(() {
        setState(() {});
      }); // curve = type animation

    controller.forward(); // play animation
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 20 * animation.value,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Counter Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterAnimation(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Tween Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TweenAnimationExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Chain Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeChainAnimation(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Example project'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyDetailsAnimator(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated align'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedAlignExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated builder'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedBuilderExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated container'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedContainerExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated cross fade'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedCrossFadeExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated text'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefaultTextStyleTransitionExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text('Animated list'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedListSample(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

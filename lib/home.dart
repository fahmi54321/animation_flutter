import 'package:animaton_with_flutter/animated_align_example.dart';
import 'package:animaton_with_flutter/animated_builder_example.dart';
import 'package:animaton_with_flutter/animated_container_example.dart';
import 'package:animaton_with_flutter/animated_cross_faded_example.dart';
import 'package:animaton_with_flutter/animated_list_example.dart';
import 'package:animaton_with_flutter/animated_opacity_example.dart';
import 'package:animaton_with_flutter/animated_positioned_example.dart';
import 'package:animaton_with_flutter/animated_size_example.dart';
import 'package:animaton_with_flutter/animated_text_example.dart';
import 'package:animaton_with_flutter/animated_widget_example.dart';
import 'package:animaton_with_flutter/company_profile/ui/company_details_animator.dart';
import 'package:animaton_with_flutter/company_profile/ui/company_details_page.dart';
import 'package:animaton_with_flutter/counter_animation.dart';
import 'package:animaton_with_flutter/decorated_box_transition_example.dart';
import 'package:animaton_with_flutter/fade_transition_example.dart';
import 'package:animaton_with_flutter/hero_example.dart';
import 'package:animaton_with_flutter/home_chain_animation.dart';
import 'package:animaton_with_flutter/positioned_transition_example.dart';
import 'package:animaton_with_flutter/rotation_transition_example.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 16 / 4,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Counter Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterAnimation(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Tween Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TweenAnimationExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Chain Animation'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeChainAnimation(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Example project'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompanyDetailsAnimator(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated align'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedAlignExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated builder'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedBuilderExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated container'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedContainerExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated cross fade'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedCrossFadeExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated text'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DefaultTextStyleTransitionExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated list'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedListSample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated opacity'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoFade(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated positioned'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedPositionedExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated size'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedSizeExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Animated widget'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimatedWidgetExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Decorated box transition'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DecoratedBoxTransitionExampleApp(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Fade transition'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FadeTransitionExampleApp(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Hero transition'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HeroExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Positioned transition'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PositionedTransitionExample(),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Rotation transition'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RotationTransitionExample(),
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

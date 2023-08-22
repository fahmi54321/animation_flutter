import 'package:animaton_with_flutter/hero/hero_1_example.dart';
import 'package:animaton_with_flutter/hero/hero_2_example.dart';
import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HeroExample1(),
                    ),
                  );
                },
                child: const Text(
                  'Hero 1',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HeroExample2(),
                    ),
                  );
                },
                child: const Text(
                  'Hero 2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

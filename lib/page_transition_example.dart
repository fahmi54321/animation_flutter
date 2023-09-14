import 'package:animaton_with_flutter/page_transition/page_route_builder_example_1.dart';
import 'package:flutter/material.dart';

class PageTransitionExample extends StatelessWidget {
  const PageTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (_) => const PageRouteBuilderExample1(),
                  ),
                );
              },
              child: const Text('Page route builder'),
            ),
          ],
        ),
      ),
    );
  }
}

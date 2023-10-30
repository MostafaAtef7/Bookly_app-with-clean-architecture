import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {

  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder => wrape widget that use animation to rebuild it only without rebuild all UI
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              "Open Your Mind",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}

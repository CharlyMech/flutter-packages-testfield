import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/custom_card.dart';
import 'package:rive/rive.dart';

class RiveContent extends StatelessWidget {
  const RiveContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Text(
          "Rive is a powerful animation platform that allows you to design, animate, and export interactive motion graphics for use in various applications, including Flutter, web, and games and several more open-source runtimes. It provides a user-friendly interface for creating complex animations, including transitions, gestures, and data-driven interactions.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        CustomCard(
          width: contextWidth,
          height: contextWidth - 100,
          padding: const EdgeInsets.all(20),
          child: const RiveAnimation.asset(
            'assets/rive/dash.riv',
          ),
        )
      ],
    );
  }
}

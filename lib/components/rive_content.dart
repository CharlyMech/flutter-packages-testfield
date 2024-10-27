import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/custom_card.dart';
import 'package:rive/rive.dart';

class RiveContent extends StatefulWidget {
  const RiveContent({super.key});

  @override
  State<RiveContent> createState() => _RiveContentState();
}

class _RiveContentState extends State<RiveContent> {
  SMIBool? dance;
  SMITrigger? lookUp;
  bool _isDancing = false;

  @override
  void initState() {
    super.initState();
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'birb');
    artboard.addController(controller!);

    dance = controller.findInput<bool>('dance') as SMIBool;
    lookUp = controller.findSMI('look up');
  }

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Text(
          "Rive is a powerful animation platform that allows you to design, animate, and export interactive motion graphics, including Flutter, web, and games and several more open-source runtimes. It provides a user-friendly interface for creating complex animations, including transitions, gestures, and data-driven interactions.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          // Temporary?
          height: 30,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Example',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline)),
          const Text.rich(TextSpan(
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              children: [
                TextSpan(text: 'Let me introduce you to '),
                TextSpan(
                  text: 'Dash',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        ', Flutter\'s pet. Dash likes to dance and look up, try it!'),
              ])),
          const SizedBox(
            // Temporary?
            height: 10,
          ),
          CustomCard(
            width: contextWidth,
            height: contextWidth - 100,
            padding: const EdgeInsets.all(20),
            child: RiveAnimation.network(
              'https://public.rive.app/community/runtime-files/2063-4080-flutter-puzzle-hack-project.riv',
              stateMachines: const ['birb'],
              artboard: 'birb',
              onInit: _onRiveInit,
            ),
          ),
          const SizedBox(
            // Temporary?
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () => lookUp?.fire(),
                  child: const Text('Look Up!')),
              Row(
                children: [
                  const Text(
                    'Dance!',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Switch(
                      value: _isDancing,
                      onChanged: (_) {
                        setState(() {
                          if (dance != null) {
                            dance!.value = !_isDancing;
                            _isDancing = !_isDancing;
                          }
                        });
                      }),
                ],
              ),
            ],
          ),
        ]),
        const SizedBox(
          // Temporary?
          height: 30,
        ),
      ],
    );
  }
}

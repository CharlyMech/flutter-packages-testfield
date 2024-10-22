import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PackageScreen extends StatelessWidget {
  final String title;
  final Widget child;
  const PackageScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 5,
        shadowColor: Theme.of(context).shadowColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}

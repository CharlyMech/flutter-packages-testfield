import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/bottom_sheet_content.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Package TestField'),
        elevation: 5,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: Center(child: Text('home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet<void>(
            // expand: true,
            context: context,
            builder: (BuildContext context) => const BottomSheetContent(),
          );
        },
        child: const Icon(Icons.keyboard_arrow_up_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

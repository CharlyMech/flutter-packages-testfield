import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/bottom_sheet_content.dart';
import 'package:flutter_kitchen/components/custom_card.dart';
import 'package:flutter_kitchen/constants/packages.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final pkg = packages[index];
            return CustomCard(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Text(pkg.name),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            builder: (BuildContext context) => const BottomSheetContent(),
          );
        },
        child: const Icon(Icons.keyboard_arrow_up_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

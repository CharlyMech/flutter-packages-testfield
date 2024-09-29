import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/bottom_sheet_content.dart';
import 'package:flutter_kitchen/components/custom_card.dart';
import 'package:flutter_kitchen/components/package_card_content.dart';
import 'package:flutter_kitchen/constants/packages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatelessWidget {
  final String appTitle;
  const Home({super.key, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
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
              height: 110,
              margin: const EdgeInsets.symmetric(vertical: 5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: PackageCardContent(
                package: pkg,
              ),
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

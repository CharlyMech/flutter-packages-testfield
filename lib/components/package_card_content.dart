import 'package:flutter/material.dart';
import 'package:flutter_kitchen/models/package.dart';

class PackageCardContent extends StatelessWidget {
  final Package package;
  const PackageCardContent({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.15),
      onTap: () => print('Hello ${package.name}'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                print('touched ${package.name}');
              },
              icon: const Icon(Icons.star_border_outlined),
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    package.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    package.shortDescr,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}

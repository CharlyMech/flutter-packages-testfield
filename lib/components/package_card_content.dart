import 'package:flutter/material.dart';
import 'package:flutter_kitchen/models/package.dart';
import 'package:go_router/go_router.dart';

class PackageCardContent extends StatefulWidget {
  final Package package;
  const PackageCardContent({super.key, required this.package});

  @override
  State<PackageCardContent> createState() => _PackageCardContentState();
}

class _PackageCardContentState extends State<PackageCardContent> {
  bool _isLiked = false; // might be temporary until sqlite comes in...

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.15),
      onTap: () => context.push(widget.package.route),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.package.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                        icon: Icon(_isLiked ? Icons.star : Icons.star_border),
                        color: Theme.of(context).primaryColor,
                        isSelected: _isLiked,
                      ),
                    ],
                  ),
                  // const SizedBox(height: 5),
                  Text(
                    widget.package.shortDescr,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

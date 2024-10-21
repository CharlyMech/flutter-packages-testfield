import 'package:flutter/material.dart';
import 'package:flutter_kitchen/models/package.dart';

final List<Package> packages = [
  Package(
      id: UniqueKey().hashCode,
      name: 'Rive',
      shortDescr:
          'Create rich animations with powerful tools, making them interactive and ready to use across platforms.',
      documentationLink: 'https://rive.app/',
      pubDevLink: 'https://pub.dev/packages/rive',
      route: '/rive'),
  Package(
      id: UniqueKey().hashCode,
      name: 'Logger',
      shortDescr:
          'Flexible logging library for your Flutter app, allowing you to easily log several messages types through console.',
      pubDevLink: 'https://pub.dev/packages/logger',
      route: '/logger'),
  Package(
      id: UniqueKey().hashCode,
      name: 'FL Chart',
      shortDescr:
          'Rich set of customizable charts including line, bar, and pie charts, to visualize your data effectively in your Flutter app.',
      pubDevLink: 'https://pub.dev/packages/fl_chart',
      route: '/fl_chart'),
  Package(
      id: UniqueKey().hashCode,
      name: 'Introduction Screen',
      shortDescr:
          'Create informative and visually appealing onboarding screens to guide new users through app\'s features.',
      pubDevLink: 'https://pub.dev/packages/introduction_screen',
      route: '/introduction_screen'),
];

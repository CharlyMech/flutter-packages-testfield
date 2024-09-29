import 'package:flutter_kitchen/screens/home.dart';
import 'package:flutter_kitchen/screens/packages/fl_chart/fl_chart_screen.dart';
import 'package:flutter_kitchen/screens/packages/introduction_screen/introduction_screen_screen.dart';
import 'package:flutter_kitchen/screens/packages/logger/logger_screen.dart';
import 'package:flutter_kitchen/screens/packages/rive/rive_screen.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(
      appTitle: 'Flutter Kitchen',
    ),
  ),
  GoRoute(
    path: '/rive',
    builder: (context, state) => const RiveScreen(),
  ),
  GoRoute(
    path: '/fl_chart',
    builder: (context, state) => const FlChartScreen(),
  ),
  GoRoute(
    path: '/logger',
    builder: (context, state) => const LoggerScreen(),
  ),
  GoRoute(
    path: '/introduction_screen',
    builder: (context, state) => const IntroductionScreenScreen(),
  ),
]);

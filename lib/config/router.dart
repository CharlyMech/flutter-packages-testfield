import 'package:flutter/material.dart';
import 'package:flutter_kitchen/layouts/package_layout.dart';
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
      title: 'Flutter Kitchen',
    ),
  ),
  GoRoute(
    path: '/rive',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PackageLayout(
          title: 'Rive',
          child: RiveScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
  ),
  GoRoute(
    path: '/fl_chart',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PackageLayout(title: 'FL Chart', child: FlChartScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
  ),
  GoRoute(
    path: '/logger',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PackageLayout(title: 'Logger', child: LoggerScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
  ),
  GoRoute(
    path: '/introduction_screen',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PackageLayout(
            title: 'Introduction Screen', child: IntroductionScreenScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
  ),
]);

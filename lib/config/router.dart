import 'package:flutter/material.dart';
import 'package:flutter_kitchen/components/fl_chart/fl_chart_content.dart';
import 'package:flutter_kitchen/components/introduction_screen_content.dart';
import 'package:flutter_kitchen/components/logger_conent.dart';
import 'package:flutter_kitchen/components/rive_content.dart';
import 'package:flutter_kitchen/screens/package_screen.dart';
import 'package:flutter_kitchen/screens/home.dart';
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
        child: const PackageScreen(
          title: 'Rive',
          child: RiveContent(),
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
        child: const PackageScreen(title: 'FL Chart', child: FlChartContent()),
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
        child: const PackageScreen(title: 'Logger', child: LoggerContent()),
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
        child: const PackageScreen(
            title: 'Introduction Screen', child: IntroductionScreenContent()),
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

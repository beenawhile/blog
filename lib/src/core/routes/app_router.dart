import 'package:blog/src/core/pages/home_screen.dart';
import 'package:blog/src/error/presentation/error_screen.dart';
import 'package:blog/src/practice/expandable_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          initialLocation: '/practice',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: '/practice',
              builder: (context, state) => const ExpandableNavBarScreen(),
            )
          ],
          errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const ErrorScreen(),
          ),
        );
}

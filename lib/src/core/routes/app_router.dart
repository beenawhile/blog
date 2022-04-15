import 'package:blog/src/core/pages/home_screen.dart';
import 'package:blog/src/core/routes/app_route_observer.dart';
import 'package:blog/src/error/presentation/error_screen.dart';
import 'package:blog/src/practice/expandable_nav_bar_screen.dart';
import 'package:blog/src/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<AppRouter>(
  (ref) => AppRouter(
    observer: ref.watch(routeObserverProvider),
  ),
);

class AppRouter extends GoRouter {
  final RouteObserver<PageRoute> observer;

  AppRouter({
    required this.observer,
  }) : super(
          initialLocation: '/',
          urlPathStrategy: UrlPathStrategy.path,
          observers: [observer],
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: HomeScreen()),
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const MaterialPage(
                child: SettingsScreen(),
              ),
            ),
            GoRoute(
              path: '/practice',
              builder: (context, state) => const ExpandableNavBarScreen(),
            ),
          ],
          errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const ErrorScreen(),
          ),
        );
}

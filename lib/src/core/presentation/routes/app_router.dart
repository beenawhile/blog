import 'package:blog/src/core/presentation/pages/home_screen.dart';
import 'package:blog/src/core/presentation/pages/error_screen.dart';
import 'package:blog/src/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_route_observer.dart';

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
          ],
          errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const ErrorScreen(),
          ),
        );
}

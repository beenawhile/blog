import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routeObserverProvider = Provider<RouteObserver<PageRoute>>(
  (ref) => AppRouteObserver(),
);

class AppRouteObserver extends RouteObserver<PageRoute> {}

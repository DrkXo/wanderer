import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/features/home/view/home.dart';
import 'package:wanderer/src/features/youtube/view/youtube.dart';

import '../features/dashboard/view/dashboard.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

enum Routes {
  home('/home', 'home'),
  youtube('/youtube', 'youtube');

  const Routes(this.name, this.key);
  final String name;
  final String key;
}

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) => goRouter;

GoRouter goRouter = GoRouter(
  initialLocation: Routes.home.name,
  navigatorKey: _rootNavigator,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Dashboard(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
        //  navigatorKey: _shellNavigator,
          routes: [
            GoRoute(
              path: Routes.home.name,
              name: Routes.home.key,
              builder: (context, state) {
                return Home(
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
       //   navigatorKey: _shellNavigator,
          routes: [
            GoRoute(
              path: Routes.youtube.name,
              name: Routes.youtube.key,
              builder: (context, state) {
                return YoutubeView(
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/features/home/view/home.dart';
import 'package:wanderer/src/features/player/view/player_maximized_view.dart';
import 'package:wanderer/src/features/youtube/view/youtube_search.dart';

import '../features/dashboard/view/dashboard.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

enum Routes {
  home('/home', 'home'),
  search('/search', 'search'),
  playerMax('/playerMax', 'playerMax'),
  youtube('/youtube', 'youtube');

  const Routes(this.name, this.path);
  final String name;
  final String path;
}

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) => goRouter;

GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
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
              name: Routes.home.path,
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
              name: Routes.youtube.path,
              builder: (context, state) {
                return YoutubeSearchView(
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.playerMax.name,
      name: Routes.playerMax.path,
      /* pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PlayerMaximizedView(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeScaleTransition(
              animation: animation,
              child: child,
            );
          },
        );
      }, */
      builder: (context, state) => const PlayerMaximizedView(),
    ),
  ],
);

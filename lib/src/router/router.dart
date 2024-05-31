import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/features/home/view/home.dart';
import 'package:wanderer/src/features/player/view/player_maximized_view.dart';
import 'package:wanderer/src/features/youtube/view/youtube_content_view.dart';

import '../features/dashboard/view/dashboard_view.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');

enum Routes {
  home('/home', 'home'),
  search('/search', 'search'),
  playerMax('/playerMax', 'playerMax'),
  youtube('/youtube', 'youtube');

  const Routes(this.path, this.name);
  final String path;
  final String name;
}

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) => goRouter;

GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.home.path,
  navigatorKey: _rootNavigator,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardView(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home.path,
              name: Routes.home.name,
              builder: (context, state) {
                return Home(
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.youtube.path,
              name: Routes.youtube.name,
              builder: (context, state) {
                return YoutubeContentView(
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.playerMax.path,
      name: Routes.playerMax.name,
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PlayerMaximizedView(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ClipRect(
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 2.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
        );
      },
      /* builder: (context, state) => const PlayerMaximizedView(), */
    ),
  ],
);

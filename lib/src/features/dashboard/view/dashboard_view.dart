import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderer/src/features/dashboard/provider/dashboard_notifier.dart';
import 'package:wanderer/src/features/player/view/player_minimized_view.dart';

import '../../../router/router.dart';
import '../../youtube/provider/youtube_search_notifier.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;
  final iconList = const [
    Icons.home_outlined,
    Icons.music_note_outlined,
  ];
  final titleList = const [
    'Home',
    'Yt',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardNotifier = ref.watch(dashboardNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          AnimSearchBar(
            rtl: true,
            width: MediaQuery.of(context).size.width / 1.2,
            textController: TextEditingController(),
            onSuffixTap: () {},
            onSubmitted: (String val) {
              if (val.trim().isNotEmpty) {
                ref
                    .read(ytSearchStateNotifierProvider.notifier)
                    .setSearchQuery(val);
                ref.read(routerProvider).goNamed(Routes.youtube.name);
              }
            },
          )
        ],
      ),
      body: AnimatedPadding(
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: navigationShell,
              ),
            ),
            const IntrinsicHeight(
              child: PlayerMinimizedView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: isActive ? Theme.of(context).primaryColor : Colors.grey,
              ),
              Text(titleList[index]),
            ],
          );
        },
        // activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeIndex: navigationShell.currentIndex,
        onTap: (int index) =>
            dashboardNotifier.onTapNavigationItem(navigationShell, index),
      ),
    );
  }
}

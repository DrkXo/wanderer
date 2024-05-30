import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderer/src/features/dashboard/provider/dashboard_notifier.dart';
import 'package:wanderer/src/features/youtube/provider/youtube_search_notifier.dart';
import 'package:wanderer/src/router/router.dart';

import '../../player/view/player_minimized_view.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

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
                ref.read(ytSearchKeyProvider.notifier).update(val);
                ref.read(routerProvider).goNamed(Routes.youtube.key);
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Yt',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) =>
            dashboardNotifier.onTapNavigationItem(navigationShell, index),
      ),
    );
  }
}

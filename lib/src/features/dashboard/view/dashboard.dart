import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';

import '../../player/view/player_view.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: navigationShell,
      bottomSheet: const PlayerMinimizedView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const item = MediaItem(
            id: 'song',
            title: 'Sample 1',
            extras: {
              'path':
                  'https://onlinetestcase.com/wp-content/uploads/2023/06/10-MB-MP3.mp3',
            },
          );

          const item1 = MediaItem(
            id: 'song1',
            title: 'Sample 2',
            extras: {
              'path': 'https://download.samplelib.com/mp3/sample-3s.mp3',
            },
          );

          await ref
              .read(audioPlayerNotifierProvider.notifier)
              .startPlayList([item, item1], 0);
        },
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
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

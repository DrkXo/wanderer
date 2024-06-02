import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/features/player/widget/audio_player_art.dart';
import 'package:wanderer/src/features/player/widget/audio_player_seeker.dart';
import 'package:wanderer/src/features/player/widget/player_control_buttons.dart';
import 'package:wanderer/src/features/player/widget/player_queue.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';


class PlayerMaximizedView extends ConsumerStatefulWidget {
  const PlayerMaximizedView({super.key});

  @override
  ConsumerState<PlayerMaximizedView> createState() =>
      _YtPlayerMaximizedViewState();
}

class _YtPlayerMaximizedViewState extends ConsumerState<PlayerMaximizedView> {
  OverlayPortalController overlayPortalController = OverlayPortalController();
  final ScrollController _scrollController = ScrollController();
  bool showControls = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSong =
        ref.watch(audioPlayerProvider.select((value) => value.currentSong));

    final playing =
        ref.watch(audioPlayerProvider.select((value) => value.playing));
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);

    if (currentSong == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    showControls = !showControls;
                  }),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: PlayerArtWidget(
                      uri: currentSong.artUri,
                    ),
                  ),
                ),
                showControls
                    ? PlayerMaximizedControlButtons(
                        audioPlayerNotifier: audioPlayerNotifier,
                        playing: playing)
                    : const SizedBox.shrink()
              ],
            ),
            const AudioPlayerSeeker(),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        floatingActionButton: OpenContainer(
          closedBuilder: (BuildContext context, openContainer) {
            return FloatingActionButton(
              onPressed: openContainer,
              // label: const Text('Current Playlist'),
              child: const Icon(
                Icons.queue_music_outlined,
              ),
            );
          },
          openBuilder: (BuildContext context, closeContainer) {
            return const FractionallySizedBox(
              heightFactor: .6,
              child: PlayerQueueWidget(),
            );
          },
        ),
      );
    }
  }
}

import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/features/player/data/playe_viewr_utils.dart';
import 'package:wanderer/src/features/player/widget/player_control_buttons.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';

class PlayerMaximizedView extends ConsumerStatefulWidget {
  const PlayerMaximizedView({super.key});

  @override
  ConsumerState<PlayerMaximizedView> createState() =>
      _YtPlayerMaximizedViewState();
}

class _YtPlayerMaximizedViewState extends ConsumerState<PlayerMaximizedView> {
  OverlayPortalController overlayPortalController = OverlayPortalController();

  bool showControls = false;

  @override
  Widget build(BuildContext context) {
    final currentSong =
        ref.watch(audioPlayerProvider.select((value) => value.currentSong));

    final playeListTimers =
        ref.watch(audioPlayerProvider.select((value) => value));
    final playing =
        ref.watch(audioPlayerProvider.select((value) => value.playing));
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);

    if (currentSong == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: PlayerViewHeroTag.artKey,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        showControls = !showControls;
                      }),
                      child: SizedBox(
                        // height: MediaQuery.of(context).size.height / 1.8,
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: currentSong.artUri.toString(),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: showControls
                        ? BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 3.0,
                              sigmaY: 3.0,
                            ),
                            child: PlayerMaximizedControlButtons(
                              audioPlayerNotifier: audioPlayerNotifier,
                              playing: playing,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Hero(
                tag: PlayerViewHeroTag.titleKey,
                child: Text(
                  currentSong.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Hero(
                tag: PlayerViewHeroTag.artistNameKey,
                child: Text(
                  currentSong.artist ?? '',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              Hero(
                tag: PlayerViewHeroTag.seekerKey,
                child: ProgressBar(
                  progress: playeListTimers.progress,
                  buffered: playeListTimers.buffered,
                  total: playeListTimers.total,
                  thumbCanPaintOutsideBar: false,
                  timeLabelLocation: TimeLabelLocation.sides,
                  onSeek: (duration) {
                    audioPlayerNotifier.seek(duration);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

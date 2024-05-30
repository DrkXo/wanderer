import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/features/player/data/playe_viewr_utils.dart';
import 'package:wanderer/src/router/router.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';

class PlayerMinimizedView extends ConsumerWidget {
  const PlayerMinimizedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      return Animate(
        effects: const [SlideEffect()],
        child: GestureDetector(
          onTap: () {
            ref.read(routerProvider).pushNamed(Routes.playerMax.path);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 80,
            width: double.infinity,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              children: [
                Row(
                  children: [
                    Hero(
                      tag: PlayerViewHeroTag.artKey,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 35,
                          width: 50,
                          child: CachedNetworkImage(
                            imageUrl: currentSong.artUri.toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: PlayerViewHeroTag.prevKey,
                            child: GestureDetector(
                              onTap: () => audioPlayerNotifier.skipToPrevious(),
                              child: const Icon(Icons.skip_previous_outlined,
                                  size: 30),
                            ),
                          ),
                          Hero(
                            tag: PlayerViewHeroTag.playPauseKey,
                            child: GestureDetector(
                              onTap: () => audioPlayerNotifier.playPause(),
                              child: Icon(
                                playing
                                    ? Icons.pause_outlined
                                    : Icons.play_arrow,
                                size: 30,
                              ),
                            ),
                          ),
                          Hero(
                            tag: PlayerViewHeroTag.nextKey,
                            child: GestureDetector(
                              onTap: () => audioPlayerNotifier.skipToNext(),
                              child: const Icon(Icons.skip_next_outlined,
                                  size: 30),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Hero(
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
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

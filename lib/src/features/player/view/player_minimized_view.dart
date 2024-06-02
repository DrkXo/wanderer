import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';
import '../widget/audio_player_seeker.dart';

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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: 80,
          width: double.infinity,
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 35,
                      width: 50,
                      child: CachedNetworkImage(
                        imageUrl: currentSong.artUri.toString(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSong.title,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          currentSong.artist ?? '',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
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
                        GestureDetector(
                          onTap: () => audioPlayerNotifier.skipToPrevious(),
                          child: const Icon(Icons.skip_previous_outlined,
                              size: 30),
                        ),
                        GestureDetector(
                          onTap: () => audioPlayerNotifier.playPause(),
                          child: Icon(
                            playing ? Icons.pause_outlined : Icons.play_arrow,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => audioPlayerNotifier.skipToNext(),
                          child: const Icon(Icons.skip_next_outlined, size: 30),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Expanded(
                child: AudioPlayerSeeker(),
              ),
            ],
          ),
        ),
      );
    }
  }
}


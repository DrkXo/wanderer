import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';

class PlayerQueueWidget extends ConsumerWidget {
  const PlayerQueueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(audioPlayerProvider.select((value) => value));
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: playerState.queue.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(playerState.queue[index].title),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

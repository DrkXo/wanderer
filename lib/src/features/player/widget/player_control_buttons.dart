import 'package:flutter/material.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';


class PlayerMaximizedControlButtons extends StatelessWidget {
  const PlayerMaximizedControlButtons({
    super.key,
    required this.audioPlayerNotifier,
    required this.playing,
  });

  final AudioPlayerNotifier audioPlayerNotifier;
  final bool playing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => audioPlayerNotifier.skipToPrevious(),
          child: Icon(
            color: Theme.of(context).primaryColor,
            Icons.skip_previous_outlined,
            size: 40,
          ),
        ),
        GestureDetector(
          onTap: () => audioPlayerNotifier.playPause(),
          child: Icon(
            color: Theme.of(context).primaryColor,
            playing ? Icons.pause_outlined : Icons.play_arrow,
            size: 40,
          ),
        ),
        GestureDetector(
          onTap: () => audioPlayerNotifier.skipToNext(),
          child: Icon(
            color: Theme.of(context).primaryColor,
            Icons.skip_next_outlined,
            size: 40,
          ),
        )
      ],
    );
  }
}

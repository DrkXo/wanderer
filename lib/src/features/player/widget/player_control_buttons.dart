import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';
import 'package:wanderer/src/features/player/data/playe_viewr_utils.dart';

import '../view/player_maximized_view.dart';

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
        Hero(
          tag: PlayerViewHeroTag.prevKey,
          child: GestureDetector(
            onTap: () => audioPlayerNotifier.skipToPrevious(),
            child: Icon(
              color: Theme.of(context).primaryColor,
              Icons.skip_previous_outlined,
              size: 40,
            ),
          ),
        ),
        Hero(
          tag: PlayerViewHeroTag.playPauseKey,
          child: GestureDetector(
            onTap: () => audioPlayerNotifier.playPause(),
            child: Icon(
              color: Theme.of(context).primaryColor,
              playing ? Icons.pause_outlined : Icons.play_arrow,
              size: 40,
            ),
          ),
        ),
        Hero(
          tag: PlayerViewHeroTag.nextKey,
          child: GestureDetector(
            onTap: () => audioPlayerNotifier.skipToNext(),
            child: Icon(
              color: Theme.of(context).primaryColor,
              Icons.skip_next_outlined,
              size: 40,
            ),
          ),
        )
      ],
    );
  }
}

mixin OverlayStateMixin<T extends StatefulWidget> on ConsumerState {
  // 2
  OverlayEntry? _overlayEntry;

  // 3
  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 4
  Widget _dismissibleOverlay(Widget child) => Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.grey,
              child: GestureDetector(
                onTap: removeOverlay,
              ),
            ),
          ),
          child,
        ],
      );

  // 5
  void _insertOverlay(Widget child) {
    // 6
    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child),
    );

    // 7
    Overlay.of(context)?.insert(_overlayEntry!);
  }
}

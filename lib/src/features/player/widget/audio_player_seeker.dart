import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';

class AudioPlayerSeeker extends ConsumerWidget {
  const AudioPlayerSeeker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playeListTimers =
        ref.watch(audioPlayerProvider.select((value) => value));
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);
    return ProgressBar(
      progress: playeListTimers.progress,
      buffered: playeListTimers.buffered,
      total: playeListTimers.total,
      thumbCanPaintOutsideBar: false,
      timeLabelLocation: TimeLabelLocation.none,
      thumbRadius: 2,
      onSeek: (duration) {
        audioPlayerNotifier.seek(duration);
      },
    );
  }
}

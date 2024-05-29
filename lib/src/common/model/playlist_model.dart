// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:audio_service/audio_service.dart';

class PlayListState {
  final bool playing;
  final List<MediaItem> queue;
  final int? queueIndex;
  final AudioServiceShuffleMode shuffleMode;
  final AudioServiceRepeatMode repeatMode;
  final Duration progress;
  final Duration total;
  final Duration buffered;

  const PlayListState({
    this.playing = false,
    required this.queue,
    this.queueIndex,
    this.shuffleMode = AudioServiceShuffleMode.none,
    this.repeatMode = AudioServiceRepeatMode.none,
    this.progress = Duration.zero,
    this.total = Duration.zero,
    this.buffered = Duration.zero,
  });

  PlayListState copyWith({
    bool? playing,
    List<MediaItem>? queue,
    int? queueIndex,
    AudioServiceShuffleMode? shuffleMode,
    AudioServiceRepeatMode? repeatMode,
    Duration? progress,
    Duration? total,
    Duration? buffered,
  }) {
    return PlayListState(
      playing: playing ?? this.playing,
      queue: queue ?? this.queue,
      queueIndex: queueIndex ?? this.queueIndex,
      shuffleMode: shuffleMode ?? this.shuffleMode,
      repeatMode: repeatMode ?? this.repeatMode,
      progress: progress ?? this.progress,
      total: total ?? this.total,
      buffered: buffered ?? this.buffered,
    );
  }

  MediaItem? get currentSong {
    if (queueIndex != null) {
      if (queue.isNotEmpty && queueIndex! < queue.length && queueIndex! > -1) {
        return queue[queueIndex!];
      }
    }
    return null;
  }
}

class VideoPlayerState {
  final bool playing;
  final Duration progress;
  final Duration total;
  final Duration buffered;
  VideoPlayerState({
    required this.playing,
    required this.progress,
    required this.total,
    required this.buffered,
  });

  VideoPlayerState copyWith({
    bool? playing,
    Duration? progress,
    Duration? total,
    Duration? buffered,
  }) {
    return VideoPlayerState(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
      total: total ?? this.total,
      buffered: buffered ?? this.buffered,
    );
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
import 'package:wanderer/src/common/model/video_player_state_model.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';

import '../../model/playlist_state_model.dart';
part 'video_controller.g.dart';

/* @riverpod
VideoPlayerController videoPlayer(VideoPlayerRef ref) {
  return ref
      .watch(videoPlayerNotifierProvider.notifier)
      .getVideoPlayerController();
} */

@riverpod
class VideoPlayerNotifier extends _$VideoPlayerNotifier {
  late VideoPlayerController _videoPlayerController;

  VideoPlayerController getVideoPlayerController() => _videoPlayerController;

  void _listeners() {
    ref.listen(
      audioPlayerProvider,
      (PlayListState? prev, PlayListState next) {
        state = VideoPlayerState(
          playing: next.playing,
          progress: state.progress,
          total: next.total,
          buffered: next.buffered,
        );
      },
    );
  }

  void _dispose() {
    _videoPlayerController.dispose();
  }

  @override
  VideoPlayerState build() {
    final audioPlayerState = ref.watch(audioPlayerProvider);
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(audioPlayerState.currentSong?.extras?['video_path']),
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ))..initialize();
    VideoPlayerState videoPlayerState = VideoPlayerState(
      playing: audioPlayerState.playing,
      progress: audioPlayerState.progress,
      total: audioPlayerState.total,
      buffered: audioPlayerState.buffered,
    );

    _listeners();

    ref.onDispose(_dispose);

    return videoPlayerState;
  }
}

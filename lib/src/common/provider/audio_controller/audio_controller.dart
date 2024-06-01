import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/common/model/db/custom_media_item.dart';
import 'package:wanderer/src/common/provider/audio_handler/audio_handler.dart';
import 'package:wanderer/src/common/repo/media_item_repo.dart';

import '../../model/playlist_state_model.dart';

part 'audio_controller.g.dart';

@Riverpod(keepAlive: true)
PlayListState audioPlayer(AudioPlayerRef ref) {
  //TODO: audioPlayer<PlayListState>(AudioPlayerRef ref) to audioPlayer(AudioPlayerRef ref)
  final x = ref.watch(audioPlayerNotifierProvider);
  return x;
}

@Riverpod(keepAlive: true)
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  late WandererAudioHandler _audioHandler;

  void playPause() {
    if (state.playing) {
      _audioHandler.pause();
    } else {
      _audioHandler.play();
    }
  }

  Future<void> startPlayList(List<MediaItem> queue, int index) async {
    await _audioHandler.customAction('start', {'queue': queue, 'index': index});
  }

  Future<void> startPlayListWithYoutubeMediaItem(
      List<MediaItem> queue, int index) async {
    await _audioHandler
        .customAction('start_yt', {'queue': queue, 'index': index});

    try {
      final box = await ref.read(mediaItemHistoryDbProvider.future);
      for (var item in queue) {
        final tmp = MediaItemDb.fromMediaItem(item);
        await box.add(tmp);
      }
    } catch (e) {
      log('$e');
    }
  }

  void reOrderQueue(int oldIndex, int newIndex) {
    _audioHandler
        .customAction('reorder', {'oldIndex': oldIndex, 'newIndex': newIndex});
  }

  void skipToNext() => _audioHandler.skipToNext();

  void skipToPrevious() => _audioHandler.skipToPrevious();

  void skipToQueueItem(int index) => _audioHandler.skipToQueueItem(index);

  void removeQueueItemAt(int index) => _audioHandler.removeQueueItemAt(index);

  void changeShuffleMode() {
    switch (state.shuffleMode) {
      case AudioServiceShuffleMode.none:
        _audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
        break;
      case AudioServiceShuffleMode.all:
        _audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
        break;
      case AudioServiceShuffleMode.group:
        //Not used
        break;
    }
  }

  void changeRepeatMode() {
    switch (state.repeatMode) {
      case AudioServiceRepeatMode.none:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
      case AudioServiceRepeatMode.all:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case AudioServiceRepeatMode.one:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case AudioServiceRepeatMode.group:
        //Not used
        break;
    }
  }

  void seek(Duration? position) {
    _audioHandler.seek(position ?? const Duration());
  }

  _listeners() {
    _audioHandler.playbackState.listen(
      (PlaybackState playbackState) {
        state = state.copyWith(
          playing: playbackState.playing,
          queueIndex: playbackState.queueIndex,
          progress: playbackState.updatePosition,
          shuffleMode: playbackState.shuffleMode,
          repeatMode: playbackState.repeatMode,
        );
      },
    );

    _audioHandler.positionDataStream().listen((onData) {
      state = state.copyWith(
        progress: onData.position,
        buffered: onData.buffered,
        total: onData.total,
      );
    });

    _audioHandler.queue.listen((List<MediaItem> queue) {
      state = state.copyWith(queue: queue);
    });

    _audioHandler.mediaItem.listen((MediaItem? mediaItem) {
      state = state.copyWith(
        total: mediaItem?.duration,
      );
    });

    AudioService.position.listen((Duration position) {
      state = state.copyWith(progress: position);
    });
  }

  @override
  PlayListState build() {
    _audioHandler = ref.watch(audioHandlerProvider);

    final initialState = _audioHandler.playbackState.value;

    final x = PlayListState(
      playing: initialState.playing,
      queueIndex: initialState.queueIndex,
      progress: initialState.updatePosition,
      shuffleMode: initialState.shuffleMode,
      repeatMode: initialState.repeatMode,
      queue: [],
    );

    _listeners();
    return x;
  }
}

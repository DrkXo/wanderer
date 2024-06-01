import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class YtVideoPlayer extends StatefulWidget {
  const YtVideoPlayer({
    super.key,
    required this.uri,
  });

  final Uri uri;

  @override
  YtVideoPlayerState createState() => YtVideoPlayerState();
}

class YtVideoPlayerState extends State<YtVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    log(widget.uri.toString());
    _controller = VideoPlayerController.networkUrl(widget.uri)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




/* class YtVideoPlayer extends ConsumerWidget {
  const YtVideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoPlayerState = ref.watch(videoPlayerNotifierProvider);
    final videoPlayernotifier = ref.watch(videoPlayerNotifierProvider.notifier);
    final videoPlayerController = ref
        .watch(videoPlayerNotifierProvider.notifier)
        .getVideoPlayerController();

    return Scaffold(
      body: Center(
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          videoPlayerController.value.isPlaying
              ? videoPlayerController.pause()
              : videoPlayerController.play();
        },
        child: Icon(
          videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
 */
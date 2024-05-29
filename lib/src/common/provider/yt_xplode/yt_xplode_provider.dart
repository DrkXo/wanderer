import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'yt_xplode_provider.g.dart';

@Riverpod(keepAlive: true)
YoutubeExplode ytXplode(YtXplodeRef ref) {
  final ytXplode = YoutubeExplode();

  ref.onDispose(ytXplode.close);

  return ytXplode;
}

@riverpod
Future<Video> ytVideo(YtVideoRef ref) async {
  final video = await ref.watch(ytXplodeProvider).videos.get('MwpMEbgC7DA');
  return video;
}

@riverpod
class YtRelatedVideos extends _$YtRelatedVideos {
  Future<void> onTapNext(Future<RelatedVideosList?> func) async {
    final data = await func;

    state = AsyncValue.data(data);
    ref.notifyListeners();
  }

  @override
  Future<RelatedVideosList?> build() async {
    final video = await ref.watch(ytVideoProvider.future);

    final related =
        await ref.watch(ytXplodeProvider).videos.getRelatedVideos(video);

    return related;
  }
}

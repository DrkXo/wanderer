import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/common/model/yt_parsed_data_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../features/youtube/provider/youtube_search_notifier.dart';

part 'yt_xplode_provider.g.dart';

@Riverpod(keepAlive: true)
YoutubeExplode ytXplode(YtXplodeRef ref) {
  final ytXplode = YoutubeExplode();

  ref.onDispose(ytXplode.close);

  return ytXplode;
}

@riverpod
Future<SearchList> ytVideoSearchList(
    YtVideoSearchListRef ref, String searchQuery) async {
  final videoList =
      await ref.watch(ytXplodeProvider).search.searchContent(searchQuery);
  return videoList;
}

@riverpod
Future<Video> ytVideo(YtVideoRef ref, String id) async {
  final video = await ref.watch(ytXplodeProvider).videos.get(id);
  return video;
}

@riverpod
Future<YtParsedData> ytStreamInfoFromId(
  YtStreamInfoFromIdRef ref,
  String id,
) async {
  try {
    StreamManifest manifest =
        await ref.watch(ytXplodeProvider).videos.streamsClient.getManifest(id);
    return YtParsedData(manifest: manifest, videoId: id);
  } catch (e) {
    throw Exception('Unable to parse youtube data!');
  }
}

@riverpod
Future<List<String>> ytVideoQuerySuggestion(
    YtVideoQuerySuggestionRef ref, String searchQuery) async {
  final suggestion =
      await ref.watch(ytXplodeProvider).search.getQuerySuggestions(searchQuery);
  return suggestion;
}

@riverpod
Future<VideoSearchList> ytVideoQuery(
    YtVideoQueryRef ref, String searchQuery) async {
  final suggestion =
      await ref.watch(ytXplodeProvider).search.search(searchQuery);
  ref
      .read(ytSearchStateNotifierProvider.notifier)
      .updateVideoSearchListData(suggestion);
  return suggestion;
}

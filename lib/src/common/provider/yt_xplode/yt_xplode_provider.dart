import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../model/yt_search_state_model.dart';

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
Future<StreamInfo> ytStreamInfoFromId(
    YtStreamInfoFromIdRef ref, String id) async {
  try {
    String quality = 'Medium'.toLowerCase();
    int qualityIndex = 0;
    StreamManifest manifest =
        await ref.watch(ytXplodeProvider).videos.streamsClient.getManifest(id);
    List<AudioOnlyStreamInfo> streamInfos =
        manifest.audioOnly.sortByBitrate().reversed.toList();
    if (quality == 'low') {
      qualityIndex = 0;
    } else if (quality == 'medium') {
      qualityIndex = (streamInfos.length / 2).floor();
    } else {
      qualityIndex = streamInfos.length - 1;
    }
    AudioOnlyStreamInfo streamInfo = streamInfos[qualityIndex];
    return streamInfo;
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
  return suggestion;
}






@riverpod
class YtSearchStateNotifier extends _$YtSearchStateNotifier {
  Future<void> addRelatedVideo(Future future) async {
    final data = await future;
    state = state.copyWith(
      relatedVideo: [
        ...state.relatedVideo,
        ...data,
      ],
    );
  }

  Future<void> addSearchList(Future future) async {
    final data = await future;
    state = state.copyWith(
      searchList: [
        ...state.searchList,
        ...data,
      ],
    );
  }

  void setSearchQuery(String value) {
    state = state.copyWith(searchQuery: value);
  }

  @override
  YtSearchModelState build() {
    return YtSearchModelState(
      videoSearchList: [],
      searchList: [],
      relatedVideo: [],
    );
  }
}

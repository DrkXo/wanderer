import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../common/model/yt_search_state_model.dart';

part 'youtube_search_notifier.g.dart';

@riverpod
class YtSearchStateNotifier extends _$YtSearchStateNotifier {
  Future<void> updateVideoSearchListData(VideoSearchList data) async {
    state = AsyncValue.data(state.value!.copyWith(
      videoSearchList: [
        ...state.value!.videoSearchList,
        ...data.map((f) => f),
      ],
    ));
  }

  Future<void> addVideoSearchListData(Future future) async {
    final data = await future;
    state = AsyncValue.data(state.value!.copyWith(
      videoSearchList: [
        ...state.value!.videoSearchList,
        ...data.map((f) => f),
      ],
    ));
  }

  Future<void> addRelatedVideoData(Future future) async {
    final data = await future;
    state = AsyncValue.data(state.value!.copyWith(
      relatedVideo: [
        ...state.value!.relatedVideo,
        ...data,
      ],
    ));
  }

  Future<void> addSearchListData(Future future) async {
    final data = await future;
    state = AsyncValue.data(state.value!.copyWith(
      searchList: [
        ...state.value!.searchList,
        ...data,
      ],
    ));
  }

  void setSearchQuery(String value) {
    state = AsyncValue.data(state.value!.copyWith(searchQuery: value));
  }

  @override
  FutureOr<YtSearchModelState> build() async {
    return YtSearchModelState(
      videoSearchList: [],
      searchList: [],
      relatedVideo: [],
    );
  }
}

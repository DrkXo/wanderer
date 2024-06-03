import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../common/model/yt_search_state_model.dart';

part 'youtube_search_notifier.g.dart';

@riverpod
class YtSearchStateNotifier extends _$YtSearchStateNotifier {
  Future<void> addVideoSearchListData(Future<VideoSearchList?> future) async {
    final data = await future;
    state = AsyncValue.data(state.value!.copyWith(
      videoSearchList: [
        ...state.value!.videoSearchList,
        if (data != null) ...data.map((f) => f),
      ],
    ));
  }

  Future<void> addSearchListData(Future<SearchList?> future) async {
    final data = await future;
    state = AsyncValue.data(state.value!.copyWith(
      searchList: [
        ...state.value!.searchList,
        if (data != null) data,
      ],
    ));
  }

  void setSearchQuery(String value) {
    state = AsyncValue.data(
      YtSearchModelState(
        searchQuery: value,
        videoSearchList: [],
        searchList: [],
      ),
    );
  }

  @override
  FutureOr<YtSearchModelState> build() async {
    return YtSearchModelState(
      videoSearchList: [],
      searchList: [],
    );
  }
}

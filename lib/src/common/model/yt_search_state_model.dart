import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtSearchModelState {
  final String? searchQuery;
  final Video? selectedVideo;
  final List<Video> videoSearchList;
  final List<SearchList> searchList;
  final List<Video> relatedVideo;
  YtSearchModelState({
    this.searchQuery,
    this.selectedVideo,
    required this.videoSearchList,
    required this.searchList,
    required this.relatedVideo,
  });

  YtSearchModelState copyWith({
    String? searchQuery,
    Video? selectedVideo,
    List<Video>? videoSearchList,
    List<SearchList>? searchList,
    List<Video>? relatedVideo,
  }) {
    return YtSearchModelState(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedVideo: selectedVideo ?? this.selectedVideo,
      videoSearchList: videoSearchList ?? this.videoSearchList,
      searchList: searchList ?? this.searchList,
      relatedVideo: relatedVideo ?? this.relatedVideo,
    );
  }
}

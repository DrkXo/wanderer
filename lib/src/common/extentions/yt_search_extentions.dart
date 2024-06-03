import 'package:youtube_explode_dart/youtube_explode_dart.dart';

extension YtSearchResult on SearchList {
  List<dynamic> get mapResultsIntoList {
    final List<dynamic> x = [];

    for (var f in this) {
      f.map(
        video: (SearchVideo video) {
          x.add(video);
        },
        playlist: (SearchPlaylist playlist) {
          x.add(playlist);
        },
        channel: (SearchChannel channel) {
          x.add(channel);
        },
      );
    }
    return x;
  }


}

import 'package:audio_service/audio_service.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

extension YtVideoExtention on Video {
  MediaItem toMediaItem({required String url}) {
    return MediaItem(
      id: id.value,
      title: title,
      duration: duration,
      album: author,
      artUri: Uri.parse(thumbnails.mediumResUrl),
      extras: {
        'path': url,
      },
    );
  }
}

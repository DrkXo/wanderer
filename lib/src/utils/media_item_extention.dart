import 'package:audio_service/audio_service.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

extension YtVideoExtension on Video {
  MediaItem toMediaItem({
    required String audioUrl,
    required String videoUrl,
  }) {
    return MediaItem(
      id: id.value,
      title: title,
      duration: duration,
      album: author,
      artist: author,
      artUri: Uri.parse(thumbnails.mediumResUrl),
      extras: {
        'audio_path': audioUrl,
        'video_path': videoUrl,
      },
    );
  }
}
